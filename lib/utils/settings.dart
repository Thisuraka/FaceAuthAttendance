import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static setFaceData(String faces) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("faces", faces);
  }

  static Future<String?> getFaceData() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("faces");
  }
}
