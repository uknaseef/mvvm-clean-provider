import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save data
  static Future<void> save({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else {
      throw UnsupportedError("Only String and int types are supported");
    }
  }

  // Get data
  static dynamic get({required String key, required Type type}) {
    if (type == String) {
      return _prefs.getString(key);
    } else if (type == int) {
      return _prefs.getInt(key);
    } else {
      throw UnsupportedError("Only String and int types are supported");
    }
  }

  // Remove data
  static Future<bool> remove({required String key}) async {
    return await _prefs.remove(key);
  }

  // Clear all data
  static Future<bool> clearAll() async => await _prefs.clear();
}
