// To parse this JSON data, do
//
//     final getFoodById = getFoodByIdFromJson(jsonString);

import 'dart:convert';

GetFoodById getFoodByIdFromJson(String str) => GetFoodById.fromJson(json.decode(str));

String getFoodByIdToJson(GetFoodById data) => json.encode(data.toJson());

class GetFoodById {
    List<FoodHistory>? foodHistory;

    GetFoodById({
        this.foodHistory,
    });

    factory GetFoodById.fromJson(Map<String, dynamic> json) => GetFoodById(
        foodHistory: json["foodHistory"] == null ? [] : List<FoodHistory>.from(json["foodHistory"]!.map((x) => FoodHistory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foodHistory": foodHistory == null ? [] : List<dynamic>.from(foodHistory!.map((x) => x.toJson())),
    };
}
class FoodHistory {
  String? id;
  String? userId;
  String? foodName;
  double? calories; // Change type to double
  DateTime? time;
  int? v;
  double? fat; // Change type to double
  double? carbohydrate; // Change type to double
  double? protein; // Change type to double
  String? imgPath;

  FoodHistory({
    this.id,
    this.userId,
    this.foodName,
    this.calories,
    this.time,
    this.v,
    this.fat,
    this.carbohydrate,
    this.protein,
    this.imgPath,
  });

factory FoodHistory.fromJson(Map<String, dynamic> json) => FoodHistory(
  id: json["_id"],
  userId: json["userId"],
  foodName: json["foodName"],
  calories: json["calories"]?.toDouble(), // Use null-aware operator
  time: json["time"] == null ? null : DateTime.parse(json["time"]),
  v: json["__v"],
  fat: json["fat"]?.toDouble(), // Use null-aware operator
  carbohydrate: json["carbohydate"]?.toDouble(), // Use null-aware operator
  protein: json["protein"]?.toDouble(), // Use null-aware operator
  imgPath: json["imgPath"],
);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "foodName": foodName,
        "calories": calories,
        "time": time?.toIso8601String(),
        "__v": v,
        "fat": fat,
        "carbohydate": carbohydrate,
        "protein": protein,
        "imgPath": imgPath,
      };
}
