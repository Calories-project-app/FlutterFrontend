import 'dart:convert';

class FoodItem {
  String id;
  String userId;
  String foodName;
  double calories;
  double fat;
  double carbohydrate;
  double protein;
  String imgPath;
  String time;

  FoodItem({
    required this.id,
    required this.userId,
    required this.foodName,
    required this.calories,
    required this.fat,
    required this.carbohydrate,
    required this.protein,
    required this.imgPath,
    required this.time,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['_id'],
      userId: json['userId'],
      foodName: json['foodName'],
      calories: json['calories'].toDouble(),
      fat: json['fat'].toDouble(),
      carbohydrate: json['carbohydate'].toDouble(),
      protein: json['protein'].toDouble(),
      imgPath: json['imgPath'],
      time: json['time'],
    );
  }
}
