import 'package:building_ui/exports/exports.dart';

//* Constructor Injection
class MysharedPref {
  static SharedPreferences? _prefs;

//  static MysharedPref _instance;

  Future getInstance() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  Future<String?> getString(String value) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    return _prefs!.getString(value);
  }

  Future<bool?> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return _prefs!.setString(key, value);
  }

  Future<bool?> getBool(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return _prefs!.getBool(value);
  }

  Future<bool?> setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return _prefs!.setBool(key, value);
  }
}

final prefProvider = Provider((ref) {
  return MysharedPref();
});
