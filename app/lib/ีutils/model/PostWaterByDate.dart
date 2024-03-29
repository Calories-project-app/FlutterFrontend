import 'dart:convert';

class WaterHistory {
  String id;
  String userId;
  String waterName;
  double calories;
  double caffeine;
  double sugar;
  double intake;
  String time;

  WaterHistory({
    required this.id,
    required this.userId,
    required this.waterName,
    required this.calories,
    required this.caffeine,
    required this.sugar,
    required this.intake,
    required this.time,
  });

  factory WaterHistory.fromJson(Map<String, dynamic> json) {
    return WaterHistory(
      id: json['_id'],
      userId: json['userId'],
      waterName: json['waterName'],
      calories: json['calories'].toDouble(),
      caffeine: json['caffeine'].toDouble(),
      sugar: json['sugar'].toDouble(),
      intake: json['intake'].toDouble(),
      time: json['time'],
    );
  }
}
