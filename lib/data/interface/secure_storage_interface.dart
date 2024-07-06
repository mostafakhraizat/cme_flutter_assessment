abstract interface class SecureStorageInterface {
  Future<void> setEmail(String email);
  Future<String?> getEmail();
}
