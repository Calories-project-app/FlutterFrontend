import 'dart:convert';

class FoodHistory {
  final String id;
  final String userId;
  final String waterName;
  final int calories;
  final int caffeine;
  final int sugar;
  final int intake;
  final DateTime time;

  FoodHistory({
    required this.id,
    required this.userId,
    required this.waterName,
    required this.calories,
    required this.caffeine,
    required this.sugar,
    required this.intake,
    required this.time,
  });

  factory FoodHistory.fromJson(Map<String, dynamic> json) {
    return FoodHistory(
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

class DayStatistics {
  final List<FoodHistory> foodHistory;
  final List<FoodHistory> waterHistory;
  final int totalCalories;
  final int totalLitre;
  final int totalCaffeine;
  final int totalSugar;

  DayStatistics({
    required this.foodHistory,
    required this.waterHistory,
    required this.totalCalories,
    required this.totalLitre,
    required this.totalCaffeine,
    required this.totalSugar,
  });

  factory DayStatistics.fromJson(Map<String, dynamic> json) {
    return DayStatistics(
      foodHistory: (json['foodHistory'] as List)
          .map((item) => FoodHistory.fromJson(item))
          .toList(),
      waterHistory: (json['waterHistory'] as List)
          .map((item) => FoodHistory.fromJson(item))
          .toList(),
      totalCalories: json['totalCalories'],
      totalLitre: json['totalLitre'],
      totalCaffeine: json['totalCaffeine'],
      totalSugar: json['totalSugar'],
    );
  }
}
