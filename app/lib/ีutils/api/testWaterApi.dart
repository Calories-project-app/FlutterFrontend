import 'dart:convert';
import 'package:app/%E0%B8%B5utils/model/testWater.dart';
import 'package:http/http.dart' as http;

Future<DayStatistics> fetchDayStatistics(String token, String userId, String date) async {
  final response = await http.post(
    Uri.parse('https://foodcal-app.up.railway.app/water-history/waterHistory/oneDayStatistics'),
    headers: <String, String>{
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'userId': userId,
      'date': date,
    }),
  );

  if (response.statusCode == 200) {
    return DayStatistics.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load day statistics');
  }
}
