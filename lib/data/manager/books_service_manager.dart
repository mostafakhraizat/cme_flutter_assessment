import 'dart:convert';

import 'package:cme_flutter_assessment/core/utils/enum/books_enums.dart';
import 'package:cme_flutter_assessment/data/interface/books_interface.dart';
import 'package:cme_flutter_assessment/main.dart';
import 'package:cme_flutter_assessment/model/book.dart';
import 'package:cme_flutter_assessment/model/books_respose.dart';

class BooksServiceManager implements BooksInterface {
  @override
  Future<BooksResponse> fetchBooks(String email) async {
    final response = await client.api.post('', data: {"user_email": email});
    if (response.statusCode == 200 ||
        response.statusCode ==
            304 /*not changed, in case of cached response*/) {
      Iterable<dynamic> booksIterable = response.data['books'];
      final List<Book> books = booksIterable
          .map(
            (e) => Book.fromJson(e),
          )
          .toList();
      return BooksResponse(BooksResponseState.success, books);
    }
    return BooksResponse(BooksResponseState.fail, []);
  }
}
