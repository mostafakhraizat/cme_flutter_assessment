import 'package:cme_flutter_assessment/src/data/manager/books_service_manager.dart';
import 'package:cme_flutter_assessment/src/data/model/books_respose.dart';

class BooksRepository {
  Future<BooksResponse> fetchBooks(String email) =>
      BooksServiceManager().fetchBooks(email);
}
