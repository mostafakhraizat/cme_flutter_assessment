part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}

class BooksInitialEvent extends BooksEvent {}

class BookReOrderEvent extends BooksEvent {
  final int oldIndex;
  final int newIndex;

  BookReOrderEvent(this.oldIndex, this.newIndex);
}
