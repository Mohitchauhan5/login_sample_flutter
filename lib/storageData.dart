import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String valueSharedPreferences = '';

// Write DATA
  static saveUserData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(valueSharedPreferences, value);
  }

// Read Data
  static getUserData() async {
    // prefs = await SharedPreferences.getInstance();
    // String value = prefs.getString("username");
    // print(value);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.getString(valueSharedPreferences);
  }
}
