import 'package:cme_flutter_assessment/data/manager/books_service_manager.dart';
import 'package:cme_flutter_assessment/model/book.dart';
import 'package:cme_flutter_assessment/model/books_respose.dart';

class BooksRepository {
  Future<BooksResponse> fetchBooks(String email) =>
      BooksServiceManager().fetchBooks(email);
}
