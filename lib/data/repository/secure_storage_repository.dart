import 'package:cme_flutter_assessment/data/interface/secure_storage_interface.dart';
import 'package:cme_flutter_assessment/utils/secure_storage_helper.dart';
import 'package:flutter/animation.dart';

class SecureStorageRepository implements SecureStorageInterface {
  SecureStorageHelper secureStorageHelper = SecureStorageHelper();
  @override
  Future<void> setEmail(String email) {
    // implement setEmail
    return secureStorageHelper.write("email", email);
  }
}
