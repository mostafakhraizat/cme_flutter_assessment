import 'dart:async';
import 'package:cme_flutter_assessment/resources/strings.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class Api {
  Dio api = Dio(
    BaseOptions(
      baseUrl: ApiUrl.baseUrl,
    ),
  );
  Api() {
    initialize();
  }
  void initialize() async {
    api.interceptors.add(RetryInterceptor(
      dio: api,
      logPrint: (message) {
        //todo: implement log mixins
      },
      retries: 3,
      retryDelays: const [
        Duration(seconds: 3),
        Duration(seconds: 3),
        Duration(seconds: 3),
      ],
    ));
  }
}
