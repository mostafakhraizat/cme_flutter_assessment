import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<void> write(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await secureStorage.read(key: key);
  }
}
