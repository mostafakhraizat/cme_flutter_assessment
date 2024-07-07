import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cme_flutter_assessment/core/utils/enum/books_enums.dart';
import 'package:cme_flutter_assessment/data/model/book.dart';
import 'package:cme_flutter_assessment/data/model/books_respose.dart';
import 'package:cme_flutter_assessment/data/model/graph.dart';
import 'package:cme_flutter_assessment/data/repository/books_repository.dart';
import 'package:cme_flutter_assessment/data/repository/secure_storage_repository.dart';
import 'package:cme_flutter_assessment/data/repository/shared_preferences_repository.dart';
import 'package:meta/meta.dart';

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
    on<BookReorderEvent>((event, emit) async {
      //important step to store the action in the shared preferences
      //store the action with no await
      addGraphAction(event.oldIndex, event.newIndex);
      reorderBooks(
        event.oldIndex,
        event.newIndex,
      );
      emit(BooksSuccessState(books));
    });
  }
  //save to graph map
  addGraphAction(int oldIndex, int newIndex) {
    _sharedPreferencesRepository.saveGraphAction(
        books.elementAt(oldIndex).slug, newIndex, _graph);
  }

  //reorder the books from event
  void reorderBooks(int oldIndex, int newIndex) {
    //need to check for dragging down, to avoid last element(lastindex +1) exception
    if (oldIndex < newIndex) {
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
        return BooksErrorState("An error occurred while loading books.");
      case BooksResponseState.networkError:
        return BooksErrorState(
            "Network error, Please check your internet connection and try again.");
      case BooksResponseState.clientError:
        return BooksErrorState(
            "Unable to get books right now, please try again later.");
      case BooksResponseState.serverError:
        return BooksErrorState(
            "Server didn't respond, please try again later.");
      case BooksResponseState.unknown:
        return BooksErrorState(
            "An unknown error occurred while getting your books.");
      default:
        return BooksErrorState(
            "An unknown error occurred while getting your books.");
    }
  }

  void reorderBooksFromGraph(List<Book> books) async {
    Graph graph = await _sharedPreferencesRepository.getGraphActions();
    for (final node in graph.getAllNodesData().entries) {
      final bookItem = books
          .where(
            (element) => element.slug == node.key,
          )
          .firstOrNull;
      if (bookItem != null) {
        reorderBooks(books.indexOf(bookItem), node.value);
      }
    }
  }
}
