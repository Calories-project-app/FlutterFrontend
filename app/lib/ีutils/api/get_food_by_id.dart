import 'dart:convert';
import 'package:app/%E0%B8%B5utils/model/GetFoodById.dart';
import 'package:app/%E0%B8%B5utils/sharedPerference.dart';
import 'package:app/%E0%B8%B5utils/shared_preference/temp_auth_token.dart';
import 'package:http/http.dart' as http;

Future<GetFoodById> getFoodById(String userId) async {
  var url =
      "https://foodcal-api-latest.onrender.com/food-history/foodHistory/${userId}";
  var token = Shared.getToken().toString();
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
