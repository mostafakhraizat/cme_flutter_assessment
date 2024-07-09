import 'package:cme_flutter_assessment/core/utils/helper/secure_storage_helper.dart';
import 'package:cme_flutter_assessment/src/data/interface/secure_storage_interface.dart';

class SecureStorageManager implements SecureStorageInterface {
  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  @override
  Future<void> setEmail(String email) {
    return secureStorageHelper.write("Email", email);
  }

  @override
  Future<String?> getEmail() async {
    return await secureStorageHelper.read("Email");
  }
}
