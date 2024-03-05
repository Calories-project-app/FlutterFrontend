import 'dart:convert';
import 'package:app/%E0%B8%B5utils/model/PostFoodbyDate.dart';
import 'package:http/http.dart' as http;

class FoodHistoryApi {
  static const String baseUrl =
      "https://foodcal-app.up.railway.app/food-history/foodHistory";

  static Future<List<FoodItem>> getFoodHistory(
      String userId, String date, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/oneDayStatistics'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'userId': userId,
        'date': date,
      }),
    );
    print("This is body");
    print(response.body);
    print("This is Header");
    print(response.headers);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['foodHistory'];
      return data.map((json) => FoodItem.fromJson(json)).toList();
    } else {
      /*print(userId);
      print(date);
      print(token);
      print(response);*/
      throw Exception('Failed to load food history');
    }
  }
}
