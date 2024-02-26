import 'dart:convert';
import 'package:app/%E0%B8%B5utils/model/GetFoodById.dart';
import 'package:app/%E0%B8%B5utils/shared_preference/temp_auth_token.dart';
import 'package:http/http.dart' as http;

Future<GetFoodById> getFoodById(String userId) async {
  var url = "https://foodcal-app.up.railway.app/food-history/foodHistory/${userId}";
  var token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NTZmMzFkOTA1MDVlMjY3ZWJmNWVhNTciLCJpYXQiOjE3MDg0ODc3OTEsImV4cCI6MTcwOTA5MjU5MX0.RkjXI3JPRWY_0vx9x9uLrhk6hwifuilKv4kJ8dpyKuc';
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': token
  };
  try {
    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    print(requestHeaders);
    print("This is Header");
    if (response.statusCode == 200) {
      String responseString = utf8.decode(response.bodyBytes);
      final _getdata = getFoodByIdFromJson(responseString);

      print("string");
      print(responseString);
      print(_getdata.toString() + "this is get");
      return _getdata;
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
