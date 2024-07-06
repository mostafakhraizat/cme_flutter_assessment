import 'package:cme_flutter_assessment/core/utils/mixin/logger_mixin.dart';
import 'package:cme_flutter_assessment/resources/strings.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class Api with LoggerMixin {
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
        logInfo(message, stackTrace: StackTrace.current);
      },
      retries: 3,
      retryEvaluator: (error, attempt) {
        logInfo("Retrying:$attempt");
        return attempt < 3;
      },
      retryDelays: const [
        Duration(seconds: 3),
        Duration(seconds: 3),
        Duration(seconds: 3),
      ],
    ));
    api.interceptors.add(
      LogInterceptor(
        logPrint: (object) {
          logInfo(object.toString());
        },
        //I can modify based on my debug case
        error: true,
        request: false,
        requestBody: false,
        requestHeader: false,
        responseBody: false,
        responseHeader: false,
      ),
    );
  }
}
