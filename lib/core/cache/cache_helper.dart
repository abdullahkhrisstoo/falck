import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static String USER_DATA_KEY = 'user-data-key';

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is List<String>) return await sharedPreferences.setStringList(key, value);
    return await sharedPreferences.setString(key, value);
  }

  // Save a JSON object as a string
  static Future<bool> saveJsonData({required String key, required Map<String, dynamic> jsonData}) async {
    final jsonString = jsonEncode(jsonData);
    return await saveData(key: key, value: jsonString);
  }

  // Retrieve and decode a JSON object from a string
  static Map<String, dynamic>? getJsonData({required String key}) {
    final jsonString = getData(key: key);
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }
}
