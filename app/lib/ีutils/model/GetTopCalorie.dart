import 'dart:convert';

class FoodStreak {
  final String id;
  final String name;
  final int foodStreak;

  FoodStreak({
    required this.id,
    required this.name,
    required this.foodStreak,
  });

  factory FoodStreak.fromJson(Map<String, dynamic> json) {
    return FoodStreak(
      id: json['_id'],
      name: json['name'],
      foodStreak: json['foodStreak'],
    );
  }
}
