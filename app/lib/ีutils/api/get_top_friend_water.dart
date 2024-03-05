import 'dart:convert';
import 'package:app/%E0%B8%B5utils/model/GetTopWater.dart';
import 'package:http/http.dart' as http;


class WaterStreakAPI {
  static Future<List<WaterStreak>> fetchWaterStreakFriends(String userId) async {
    final response = await http.get(
        Uri.parse('https://foodcal-app.up.railway.app/users/water-streak-friends?userId=$userId'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<WaterStreak> waterStreakFriends = data.map((json) => WaterStreak.fromJson(json)).toList();
      return waterStreakFriends;
    } else {
      throw Exception('Failed to load water streak friends');
    }
  }
}
