import 'package:shared_preferences/shared_preferences.dart';

class cachenetwork {
  static late SharedPreferences sharedpref;
  static Future cacheInitialization() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  static Future<bool> insertcache(
      {required String key, required String value}) async {
    return await sharedpref.setString(key, value);
  }

  static String getcachedata({required String key}) {
    return sharedpref.getString(key) ?? "";
  }

  static Future<bool> deletecache({required String key}) async {
    return await sharedpref.remove(key);
  }
}
