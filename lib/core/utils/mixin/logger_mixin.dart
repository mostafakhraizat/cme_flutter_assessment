import 'dart:developer';

import 'package:flutter/foundation.dart';

mixin LoggerMixin {
  void logInfo(String info, {StackTrace? stackTrace}) {
    log("INFO:: $info");
    if (stackTrace != null && kDebugMode) {
      log(stackTrace.toString());
    }
  }

  void logError(String error, {StackTrace? stackTrace}) {
    log("Error:: $error");
    if (stackTrace != null && kDebugMode) {
      log(stackTrace.toString());
    }
  }
}
