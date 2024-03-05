import 'dart:convert';
import 'package:app/%E0%B8%B5utils/model/PostWaterByDate.dart';
import 'package:http/http.dart' as http;

class WaterHistoryApi {
  static const String baseUrl = 'https://foodcal-app.up.railway.app';
  static const String endpoint = '/water-history/waterHistory/oneDayStatistics';

  static Future<WaterHistory> fetchWaterHistory(String userId, String date, String token) async {
    final response = await http.post(
      Uri.parse(baseUrl + endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'userId': userId, 'date': date}),
    );

    if (response.statusCode == 200) {
      return WaterHistory.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load water history');
    }
  }
}
