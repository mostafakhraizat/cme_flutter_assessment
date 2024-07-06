import 'package:bloc/bloc.dart';
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
      emit(BooksLoadingState());
      final String? storedEmail = await secureStorageRepository.getEmail();
      final BooksResponse booksResponse =
          await booksRepository.fetchBooks(storedEmail ?? "");
      books = booksResponse.books;
      emit(BooksSuccessState(books));
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
}
