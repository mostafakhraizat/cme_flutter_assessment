import 'package:cme_flutter_assessment/data/interface/secure_storage_interface.dart';
import 'package:cme_flutter_assessment/utils/secure_storage_helper.dart';

class SecureStorageManager implements SecureStorageInterface {
  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  @override
  Future<void> setEmail(String email) {
    return secureStorageHelper.write("Email", email);
  }

  @override
  Future<String?> getEmail() {
    return secureStorageHelper.read("Email");
  }
}
