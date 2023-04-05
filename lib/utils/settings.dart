import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static setPersonData(String person) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("person", person);
  }

  static Future<String?> getPersonData() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("person");
  }
}
