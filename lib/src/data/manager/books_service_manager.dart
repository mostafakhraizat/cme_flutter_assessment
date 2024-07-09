import 'dart:developer';

import 'package:cme_flutter_assessment/core/utils/enum/books_enums.dart';
import 'package:cme_flutter_assessment/core/utils/mixin/logger_mixin.dart';
import 'package:cme_flutter_assessment/src/data/interface/books_interface.dart';
import 'package:cme_flutter_assessment/src/data/model/book.dart';
import 'package:cme_flutter_assessment/src/data/model/books_respose.dart';
import 'package:cme_flutter_assessment/main.dart';
import 'package:dio/dio.dart';

class BooksServiceManager with LoggerMixin implements BooksInterface {
  @override
  Future<BooksResponse> fetchBooks(String email) async {
    try {
      final response = await client.api.post('', data: {"user_email": email});
      if (response.statusCode == 200 ||
          response.statusCode ==
              304 /*not changed, in case of cached response*/) {
        Iterable<dynamic> booksIterable = response.data['books'];
        final List<Book> books =
            booksIterable.map((e) => Book.fromJson(e)).toList();
        return BooksResponse(BooksResponseState.success, books: books);
      } else if (response.statusCode == null || response.statusCode! >= 500) {
        return BooksResponse(BooksResponseState.serverError);
      }
      return BooksResponse(BooksResponseState.clientError);
    } on DioException catch (e) {
      return BooksResponse(BooksResponseState.networkError);
    } on TypeError catch (e) {
      return BooksResponse(BooksResponseState.formatError);
    } on Exception catch (e) {
      return BooksResponse(BooksResponseState.unknown);
    } catch (e) {
      return BooksResponse(BooksResponseState.unknown);
    }
  }
}
