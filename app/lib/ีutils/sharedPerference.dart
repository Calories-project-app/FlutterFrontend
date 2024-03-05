import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static late SharedPreferences _pref;
  static Future init() async => _pref = await SharedPreferences.getInstance();


  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null) {
      return token;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? info = prefs.getString('userInfo');
    if (info != null) {
      return json.decode(info);
    }
    return null;
  }

  static Future<String?> getUserId() async {
    final userInfo = await getUserInfo();
    if (userInfo != null) {
      return userInfo['_id']; // Return the user ID directly
    }
    return null; // Return null if user info is not available
  }
}
 