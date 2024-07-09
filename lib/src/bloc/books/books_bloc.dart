
import 'package:bloc/bloc.dart';
import 'package:cme_flutter_assessment/core/utils/enum/books_enums.dart';
import 'package:cme_flutter_assessment/core/utils/extensions/list_extensions.dart';
import 'package:cme_flutter_assessment/resources/strings.dart';
import 'package:cme_flutter_assessment/src/data/model/book.dart';
import 'package:cme_flutter_assessment/src/data/model/books_respose.dart';
import 'package:cme_flutter_assessment/src/data/model/graph.dart';
import 'package:cme_flutter_assessment/src/data/repository/books_repository.dart';
import 'package:cme_flutter_assessment/src/data/repository/secure_storage_repository.dart';
import 'package:cme_flutter_assessment/src/data/repository/shared_preferences_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  static List<Book> books = [];
  final BooksRepository _booksRepository;
  final SecureStorageRepository _secureStorageRepository;
  final SharedPreferencesRepository _sharedPreferencesRepository;
  final Graph _graph;
  BooksBloc(
    this._booksRepository,
    this._secureStorageRepository,
    this._sharedPreferencesRepository,
    this._graph,
  ) : super(BooksInitial()) {
    ///
    on<BooksInitialEvent>((event, emit) async {
      //reflect a loading screen
      emit(BooksLoadingState());
      final String? storedEmail = await _secureStorageRepository.getEmail();
      final BooksResponse booksResponse =
          await _booksRepository.fetchBooks(storedEmail ?? "");
      books = booksResponse.books;
      if (books.isNotEmpty) reorderBooksFromGraph(books);
      emit(evaluateBooksResponse(booksResponse.booksResponseState, books));
    });

    on<BooksRefreshEvent>((event, emit) async {
      emit(BooksLoadingState());
      final String? storedEmail = await _secureStorageRepository.getEmail();
      final BooksResponse booksResponse =
          await _booksRepository.fetchBooks(storedEmail ?? "");
      //display the error in case, and emit the prev got books.
      final processedState =
          evaluateBooksResponse(booksResponse.booksResponseState, books);
      if (processedState is BooksErrorState) {
        Fluttertoast.cancel();
        Fluttertoast.showToast(msg: processedState.reason);
      } else {
        for (Book book in books) {
          books.addWhere(
              !books.map((e) => e.id).contains(book.id), booksResponse.books);
        }
      }
      emit(BooksSuccessState(books));
    });
    on<BookReorderEvent>((event, emit) async {
      //important event, store the action in the shared preferences
      //store the action with no await
      addGraphAction(event.oldIndex, event.newIndex);
      reorderBooks(
        event.oldIndex,
        event.newIndex,
      );
      emit(BooksSuccessState(books));
    });
  }
  //save to graph
  addGraphAction(int oldIndex, int newIndex) {
    //need to check for dragging down, to avoid last element (lastindex +1) exception
    if (oldIndex < newIndex) {
      newIndex--;
    }
    _sharedPreferencesRepository.saveGraphAction(
        books.elementAt(oldIndex).id.toString(), newIndex, _graph);
  }

  //reorder the books from event
  void reorderBooks(int oldIndex, int newIndex, {bool indexSensitive = true}) {
    //need to check for dragging down, to avoid last element(lastindex +1) exception
    // indexSensitive, for this index check was already saved in the graph data, newIndex is already subtracted
    if (oldIndex < newIndex && indexSensitive) {
      newIndex--;
    }
    //switch elements
    final Book removedBook = books.removeAt(oldIndex);
    books.insert(newIndex, removedBook);
  }

  ///return state based on the book manager response
  BooksState evaluateBooksResponse(
      BooksResponseState booksResponseState, List<Book> books) {
    switch (booksResponseState) {
      case BooksResponseState.success:
        return BooksSuccessState(books);
      case BooksResponseState.formatError:
        return BooksErrorState(Strings.anErrorOccurredLoadingBooks);
      case BooksResponseState.networkError:
        return BooksErrorState(Strings.networkErrorBooksResponse);
      case BooksResponseState.clientError:
        return BooksErrorState(Strings.clientErrorBooksResponse);
      case BooksResponseState.serverError:
        return BooksErrorState(Strings.serverErrorBooksResponse);
      case BooksResponseState.unknown:
        return BooksErrorState(Strings.unknownErrorBooksResponse);
      default:
        return BooksErrorState(Strings.unknownErrorBooksResponse);
    }
  }

  //apply sort from the graph data
  void reorderBooksFromGraph(List<Book> books) async {
    Graph graph = await _sharedPreferencesRepository.getGraphActions();
    for (final node in graph.getAllNodesData().entries) {
      final bookItem = books
          .where(
            (element) => element.id.toString() == node.key.toString(),
          )
          .firstOrNull;
      if (bookItem != null) {
        reorderBooks(
          books.indexOf(bookItem),
          node.value,
          indexSensitive: false,
        );
      }
    }
  }
}
