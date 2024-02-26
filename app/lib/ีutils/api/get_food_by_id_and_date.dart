import 'dart:convert';
import 'package:app/%E0%B8%B5utils/model/GetFoodOneDayByIdAndDate.dart';
import 'package:http/http.dart' as http;

Future<GetFoodOneDayByIdAndDate> getFoodByIdDate(String userId, String date, String token) async {
  var url = "https://foodcal-app.up.railway.app/food-history/foodHistory/oneDayStatistics";
  
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': token
  };

  Map<String, dynamic> requestBody = {
    "userId": userId,
    "date": date
  };

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: requestHeaders,
      body: jsonEncode(requestBody),
    );

    print(requestHeaders);
    print("This is Header");

    if (response.statusCode == 200) {
      String responseString = utf8.decode(response.bodyBytes);
      final getdata = getFoodOneDayByIdAndDateFromJson(responseString , DateTime.now().toString());
      print("string");
      print(responseString);
      print(getdata.toString() + "this is get");
      return getdata;
    } else {
      print(requestHeaders);
      print("This is Header from else");
      throw Exception(response.body);
    }
  } catch (e) {
    print(requestHeaders);
    print("This is Header from e");
    throw Exception(e.toString());
  }
}
