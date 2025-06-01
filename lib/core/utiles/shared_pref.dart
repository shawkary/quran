import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static saveInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  static saveBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  static getInt(String key) {
    return prefs.getInt(key);
  }

  static getBool(String key) {
    return prefs.getBool(key);
  }
}
