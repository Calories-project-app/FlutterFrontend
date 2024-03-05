import 'dart:convert';

class WaterHistory {
  List<FoodHistoryItem> foodHistory;
  List<WaterHistoryItem> waterHistory;
  int totalCalories;
  int totalLitre;
  int totalCaffeine;
  int totalSugar;

  WaterHistory({
    required this.foodHistory,
    required this.waterHistory,
    required this.totalCalories,
    required this.totalLitre,
    required this.totalCaffeine,
    required this.totalSugar,
  });

  factory WaterHistory.fromJson(Map<String, dynamic> json) {
    List<dynamic> foodHistoryJson = json['foodHistory'];
    List<dynamic> waterHistoryJson = json['waterHistory'];

    return WaterHistory(
      foodHistory: foodHistoryJson.map((e) => FoodHistoryItem.fromJson(e)).toList(),
      waterHistory: waterHistoryJson.map((e) => WaterHistoryItem.fromJson(e)).toList(),
      totalCalories: json['totalCalories'],
      totalLitre: json['totalLitre'],
      totalCaffeine: json['totalCaffeine'],
      totalSugar: json['totalSugar'],
    );
  }
}

class FoodHistoryItem {
  String id;
  String userId;
  String waterName;
  int calories;
  int caffeine;
  int sugar;
  int intake;
  DateTime time;

  FoodHistoryItem({
    required this.id,
    required this.userId,
    required this.waterName,
    required this.calories,
    required this.caffeine,
    required this.sugar,
    required this.intake,
    required this.time,
  });

  factory FoodHistoryItem.fromJson(Map<String, dynamic> json) {
    return FoodHistoryItem(
      id: json['_id'],
      userId: json['userId'],
      waterName: json['waterName'],
      calories: json['calories'],
      caffeine: json['caffeine'],
      sugar: json['sugar'],
      intake: json['intake'],
      time: DateTime.parse(json['time']),
    );
  }
}

class WaterHistoryItem {
  String id;
  String userId;
  String waterName;
  int calories;
  int caffeine;
  int sugar;
  int intake;
  DateTime time;

  WaterHistoryItem({
    required this.id,
    required this.userId,
    required this.waterName,
    required this.calories,
    required this.caffeine,
    required this.sugar,
    required this.intake,
    required this.time,
  });

  factory WaterHistoryItem.fromJson(Map<String, dynamic> json) {
    return WaterHistoryItem(
      id: json['_id'],
      userId: json['userId'],
      waterName: json['waterName'],
      calories: json['calories'],
      caffeine: json['caffeine'],
      sugar: json['sugar'],
      intake: json['intake'],
      time: DateTime.parse(json['time']),
    );
  }
}
