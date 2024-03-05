import 'dart:convert';
import 'package:app/%E0%B8%B5utils/api/post_food_by_date.dart';
import 'package:app/%E0%B8%B5utils/model/PostFoodbyDate.dart';
import 'package:flutter/material.dart';


class FoodHistoryScreen extends StatefulWidget {
  @override
  _FoodHistoryScreenState createState() => _FoodHistoryScreenState();
}

class _FoodHistoryScreenState extends State<FoodHistoryScreen> {
  List<FoodItem> foodHistory = [];

  late String _userId;

  @override
  void initState() {
    super.initState();
    fetchFoodHistory();
  }

  void fetchFoodHistory() async {
    String userId = "65e0a741209f286d11f263ce";
    String date = "2024-03-05";
    String token =
        "eyJhbGciOiJSUzI1NiIsImtpZCI6IjNiYjg3ZGNhM2JjYjY5ZDcyYjZjYmExYjU5YjMzY2M1MjI5N2NhOGQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZm9vZC1jYWwtNjU4YjQiLCJhdWQiOiJmb29kLWNhbC02NThiNCIsImF1dGhfdGltZSI6MTcwOTY0MTk2MiwidXNlcl9pZCI6IlRHbHNqNE5WemtjdW5MdmhCU2MxdHZaNXIybjEiLCJzdWIiOiJUR2xzajROVnprY3VuTHZoQlNjMXR2WjVyMm4xIiwiaWF0IjoxNzA5NjQxOTYyLCJleHAiOjE3MDk2NDU1NjIsImVtYWlsIjoia2xhMUBlbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsia2xhMUBlbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.RE-E615MgJMQmbthc7KLKbx58H8EgGSatF_cCz9goK8nIRky0qJvKXzZmjtWVN5ONxSG7_mpuH-vpKDJ6x7k_MSkAOxpDeBgk94LWfRzubWbxf9ppEFkpR6TjmWPUkTH-b-JlJYI6A4H6PNY1GinEdBp7vnmmQCTe7zDLNC0BSD_Ut5kPuRhxfKwRByLaaS0dKU_DZHY2wwT6NN8pHXZCdNU1mooMqB_7lqralrWulianBmNlwCjdoUbLbI9BmJmocagOEW4YsO2qLxdY1sr2R4bMbLBvCdPzcxNb9zDmnBY1YGxgN1CZpYKns5SzZ_cbo_YC6e67NhNbKW3Iw1yVg"; // Replace with actual token

    try {
      List<FoodItem> history =
          await FoodHistoryApi.getFoodHistory(userId, date, token);
      setState(() {
        foodHistory = history;
      });
    } catch (e) {
      print('Error fetching food history: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food History'),
      ),
      body: ListView.builder(
        itemCount: foodHistory.length,
        itemBuilder: (context, index) {
          FoodItem item = foodHistory[index];
          return ListTile(
            title: Text(item.foodName),
            subtitle: Text('Calories: ${item.calories.toString()}'),
            leading: Image.network(item.imgPath),
          );
        },
      ),
    );
  }
}
