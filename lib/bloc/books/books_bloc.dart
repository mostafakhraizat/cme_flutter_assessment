import 'package:bloc/bloc.dart';
import 'package:cme_flutter_assessment/core/utils/enum/books_enums.dart';
import 'package:cme_flutter_assessment/data/repository/books_repository.dart';
import 'package:cme_flutter_assessment/data/repository/secure_storage_repository.dart';
import 'package:cme_flutter_assessment/model/book.dart';
import 'package:cme_flutter_assessment/model/books_respose.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  static List<Book> books = [];
  final BooksRepository booksRepository;
  final SecureStorageRepository secureStorageRepository;
  BooksBloc(this.booksRepository, this.secureStorageRepository)
      : super(BooksInitial()) {
    on<BooksInitialEvent>((event, emit) async {
      //loading screen
      emit(BooksLoadingState());
      final String? storedEmail = await secureStorageRepository.getEmail();
      final BooksResponse booksResponse =
          await booksRepository.fetchBooks(storedEmail ?? "");
      books = booksResponse.books;
      emit(evaluateBooksResponse(booksResponse.booksResponseState, books));
    });
    on<BookReOrderEvent>((event, emit) async {
      reorderBooks(event.oldIndex, event.newIndex);
      emit(BooksSuccessState(books));
    });
  }
  void reorderBooks(int oldIndex, int newIndex) {
    //need to check for dragging down, to avoid last element(lastindex +1) exception
    if (oldIndex < newIndex) {
      newIndex--;
    }
    //switch elements
    final removedBook = books.removeAt(oldIndex);
    books.insert(newIndex, removedBook);
  }

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
}
