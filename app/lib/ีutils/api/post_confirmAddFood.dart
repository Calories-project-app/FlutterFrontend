import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future ConfirmAddFood(
    String userId,
    String foodName,
    String calories,
    String fat,
    String carbohydrate,
    String protein,
    String time,
    File imgPath,
    BuildContext _context) async {
  
  var url = "https://foodcal-app.up.railway.app/food-history/saveFood";
  var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NTZmMzFkOTA1MDVlMjY3ZWJmNWVhNTciLCJpYXQiOjE3MDg0ODc3OTEsImV4cCI6MTcwOTA5MjU5MX0.RkjXI3JPRWY_0vx9x9uLrhk6hwifuilKv4kJ8dpyKuc"; 

  // Create multipart request
  var request = http.MultipartRequest('POST', Uri.parse(url));
  
  // Add headers
  request.headers.addAll({
    'Accept': 'application/json',
    "content-type": "multipart/form-data",
    'authtoken': token
  });

  // Add fields to the request
  request.fields['userId'] = userId;
  request.fields['foodName'] = foodName;
  request.fields['calories'] = calories;
  request.fields['fat'] = fat;
  request.fields['carbohydate'] = carbohydrate; // Corrected variable name
  request.fields['protein'] = protein;
  request.fields['time'] = time;

  // Add image file to the request
  request.files.add(await http.MultipartFile.fromPath('imgFile', imgPath.path.split('/').last.toString()));

  try {
    // Send the request
    var response = await request.send();
    
    // Get response
    var responseData = await response.stream.transform(utf8.decoder).join();
    print(responseData);
    
    if (response.statusCode == 200) {
      print("Success");
    } else {
      print("Failed");
    }
  } catch (e) {
    print(e);
  }
}
