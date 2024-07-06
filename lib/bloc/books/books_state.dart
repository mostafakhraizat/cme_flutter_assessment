part of 'books_bloc.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}

final class BooksLoadingState extends BooksState {}

final class BooksSuccessState extends BooksState {
  final List<Book> books;

  BooksSuccessState(this.books);
}
