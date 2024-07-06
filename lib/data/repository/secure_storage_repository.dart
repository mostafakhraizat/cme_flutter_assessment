import 'package:cme_flutter_assessment/data/manager/secure_storage_manager.dart';

class SecureStorageRepository {
  Future<void> setEmail(String email) => SecureStorageManager().setEmail(email);
  Future<String?> getEmail() => SecureStorageManager().getEmail();
}
