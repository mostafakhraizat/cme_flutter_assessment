part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}

class BooksInitialEvent extends BooksEvent {}

class BooksRefreshEvent extends BooksEvent {
  final BuildContext context;
  BooksRefreshEvent(this.context);
}

class BookReorderEvent extends BooksEvent {
  final int oldIndex;
  final int newIndex;
  BookReorderEvent(
    this.oldIndex,
    this.newIndex,
  );
}
