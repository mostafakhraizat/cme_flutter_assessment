import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._internal();

  late SharedPreferences _sharedPreferences;

  factory SharedPreferencesHelper() {
    return _instance;
  }
  SharedPreferencesHelper._internal();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  Future<void> remove(String key) async {
    await _sharedPreferences.remove(key);
  }
}
