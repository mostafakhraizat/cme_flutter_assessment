import 'dart:developer';

mixin LoggerMixin {
  void logInfo(String info, {StackTrace? stackTrace}) {
    log("INFO:: $info");
  }
}
