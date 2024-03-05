import 'dart:convert';
import 'package:app/%E0%B8%B5utils/model/GetTopCalorie.dart';
import 'package:http/http.dart' as http;

class FoodStreakAPI {
  static Future<List<FoodStreak>> fetchFoodStreakFriends(String userId) async {
    final response = await http.get(
        Uri.parse('https://foodcal-app.up.railway.app/users/food-streak-friends?userId=$userId'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<FoodStreak> foodStreakFriends = data.map((json) => FoodStreak.fromJson(json)).toList();
      return foodStreakFriends;
    } else {
      throw Exception('Failed to load food streak friends');
    }
  }
}
