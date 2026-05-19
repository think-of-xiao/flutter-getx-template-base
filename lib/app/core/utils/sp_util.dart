import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static late SharedPreferences _sp;

  Future<void> init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String key, String value) async {
    return await _sp.setString(key, value);
  }

  static String getString(String key, {String def = ""}) {
    return _sp.getString(key) ?? def;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _sp.setBool(key, value);
  }

  static bool getBool(String key, {bool def = false}) {
    return _sp.getBool(key) ?? def;
  }

  static Future<bool> remove(String key) async {
    return await _sp.remove(key);
  }

  static Future<bool> clear() async {
    return await _sp.clear();
  }
}