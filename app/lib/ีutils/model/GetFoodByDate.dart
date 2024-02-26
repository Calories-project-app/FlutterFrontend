import 'dart:convert';

class FoodHistory {
  List<FoodItem> foodHistory = [];
  List<dynamic> waterHistory = [];
  double totalCalories = 0.0;
  double totalFat = 0.0;
  double totalCarbohydrate = 0.0;
  double totalProtein = 0.0;
  double totalLitre = 0.0;
  double totalCaffeine = 0.0;
  double totalSugar = 0.0;

  FoodHistory({
    required this.foodHistory,
    required this.totalCalories,
    required this.totalFat,
    required this.totalCarbohydrate,
    required this.totalProtein,
    required this.totalLitre,
    required this.totalCaffeine,
    required this.totalSugar,
  });

  FoodHistory.fromJson(Map<String, dynamic> json) {
    if (json['foodHistory'] != null) {
      foodHistory = <FoodItem>[];
      json['foodHistory'].forEach((v) {
        foodHistory.add(FoodItem.fromJson(v));
      });
    }
    waterHistory = json['waterHistory'] != null ? json['waterHistory'].cast<dynamic>() : [];
    totalCalories = json['totalCalories'] ?? 0.0;
    totalFat = json['totalFat'] ?? 0.0;
    totalCarbohydrate = json['totalCarbohydate'] ?? 0.0;
    totalProtein = json['totalProtein'] ?? 0.0;
    totalLitre = json['totalLitre'] ?? 0.0;
    totalCaffeine = json['totalCaffeine'] ?? 0.0;
    totalSugar = json['totalSugar'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (foodHistory.isNotEmpty) {
      data['foodHistory'] = foodHistory.map((v) => v.toJson()).toList();
    }
    data['waterHistory'] = waterHistory;
    data['totalCalories'] = totalCalories;
    data['totalFat'] = totalFat;
    data['totalCarbohydate'] = totalCarbohydrate;
    data['totalProtein'] = totalProtein;
    data['totalLitre'] = totalLitre;
    data['totalCaffeine'] = totalCaffeine;
    data['totalSugar'] = totalSugar;
    return data;
  }
}

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
  int v;

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
    required this.v,
  });

  FoodItem.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        userId = json['userId'],
        foodName = json['foodName'],
        calories = json['calories'].toDouble(),
        fat = json['fat'].toDouble(),
        carbohydrate = json['carbohydate'].toDouble(),
        protein = json['protein'].toDouble(),
        imgPath = json['imgPath'],
        time = json['time'],
        v = json['__v'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['userId'] = userId;
    data['foodName'] = foodName;
    data['calories'] = calories;
    data['fat'] = fat;
    data['carbohydate'] = carbohydrate;
    data['protein'] = protein;
    data['imgPath'] = imgPath;
    data['time'] = time;
    data['__v'] = v;
    return data;
  }
}
