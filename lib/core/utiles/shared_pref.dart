import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static saveInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  static saveDouble(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  static saveString(String key, String value) async {
    await prefs.setString(key, value);
  }

  static saveBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  static getInt(String key) {
    return prefs.getInt(key);
  }

  static getDouble(String key) {
    return prefs.getDouble(key);
  }

  static getString(String key) {
    return prefs.getString(key);
  }

  static getBool(String key) {
    return prefs.getBool(key);
  }
}
