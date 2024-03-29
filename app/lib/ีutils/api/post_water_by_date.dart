import 'dart:convert';
import 'package:app/%E0%B8%B5utils/model/PostWaterByDate.dart';
import 'package:http/http.dart' as http;

class WaterHistoryApi {
  static const String baseUrl = 'https://foodcal-api-latest.onrender.com';
  static const String endpoint = '/water-history/waterHistory/oneDayStatistics';

  static Future<List<WaterHistory>> fetchWaterHistory(
      String userId, String date, String token) async {
    final response = await http.post(
      Uri.parse(baseUrl + endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{'userId': userId, 'date': date}),
    );
    print("This is body");
    print(response.body);
    print("This is Header");
    print(response.headers);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['waterHistory'];
      return data.map((json) => WaterHistory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load water history');
    }
  }
}
