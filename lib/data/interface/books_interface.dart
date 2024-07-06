import 'package:cme_flutter_assessment/model/books_respose.dart';

abstract interface class BooksInterface {
  Future<BooksResponse> fetchBooks(String email);
}
