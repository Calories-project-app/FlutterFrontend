import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> changePassword(String email, BuildContext context) async {
  // Endpoint URL
  final String apiUrl = 'https://foodcal-app.up.railway.app/auth/change-password';

  // Request body
  Map<String, dynamic> requestBody = {
    "email": email,
  };

  // Encode the request body to JSON
  String requestBodyJson = json.encode(requestBody);

  try {
    // Make the PUT request
    final response = await http.put(
      Uri.parse(apiUrl), // Convert string to Uri object
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestBodyJson,
    );

    // Check if the request was successful (status code 200)
    if (response.statusCode == 201) {
      // Show success Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email sent successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Show failure Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to change password. Status code: ${response.statusCode}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (error) {
    // Show error Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error occurred: $error'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
