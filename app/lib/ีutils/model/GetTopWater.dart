import 'dart:convert';

class WaterStreak {
  final String id;
  final String name;
  final int waterStreak;

  WaterStreak({
    required this.id,
    required this.name,
    required this.waterStreak,
  });

  factory WaterStreak.fromJson(Map<String, dynamic> json) {
    return WaterStreak(
      id: json['_id'],
      name: json['name'],
      waterStreak: json['waterStreak'],
    );
  }
}
