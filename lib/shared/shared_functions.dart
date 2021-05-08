import 'package:shared_preferences/shared_preferences.dart';

class SharedFunctions {
  static Future<int> getType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('typeList') ?? 1;
  }

  static Future<void> setType(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('typeList', value);
  }
}
