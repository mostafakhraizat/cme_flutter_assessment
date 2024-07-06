class SharePreferencesHelper {
  final FlutterSecureStorage secureStorage;

  SecureStorageHelper(this.secureStorage);

  Future<void> write(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await secureStorage.read(key: key);
  }
}
