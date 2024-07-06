import 'package:cme_flutter_assessment/core/utils/enum/books_enums.dart';

import 'book.dart';

class BooksResponse {
  late final BooksResponseState booksResponseState;
  final List<Book> books;
  BooksResponse(this.booksResponseState, this.books);
}
