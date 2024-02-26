// To parse this JSON data, do
//
//     final getFoodOneDayByIdAndDate = getFoodOneDayByIdAndDateFromJson(jsonString);

import 'dart:convert';

GetFoodOneDayByIdAndDate getFoodOneDayByIdAndDateFromJson(String str, String date) => GetFoodOneDayByIdAndDate.fromJson(json.decode(str));

String getFoodOneDayByIdAndDateToJson(GetFoodOneDayByIdAndDate data) => json.encode(data.toJson());

class GetFoodOneDayByIdAndDate {
    List<FoodHistory>? foodHistory;
    List<dynamic>? waterHistory;
    int? totalCalories;
    int? totalFat;
    int? totalCarbohydate;
    int? totalProtein;
    int? totalLitre;
    int? totalCaffeine;
    int? totalSugar;

    GetFoodOneDayByIdAndDate({
        this.foodHistory,
        this.waterHistory,
        this.totalCalories,
        this.totalFat,
        this.totalCarbohydate,
        this.totalProtein,
        this.totalLitre,
        this.totalCaffeine,
        this.totalSugar,
    });

    factory GetFoodOneDayByIdAndDate.fromJson(Map<String, dynamic> json) => GetFoodOneDayByIdAndDate(
        foodHistory: json["foodHistory"] == null ? [] : List<FoodHistory>.from(json["foodHistory"]!.map((x) => FoodHistory.fromJson(x))),
        waterHistory: json["waterHistory"] == null ? [] : List<dynamic>.from(json["waterHistory"]!.map((x) => x)),
        totalCalories: json["totalCalories"],
        totalFat: json["totalFat"],
        totalCarbohydate: json["totalCarbohydate"],
        totalProtein: json["totalProtein"],
        totalLitre: json["totalLitre"],
        totalCaffeine: json["totalCaffeine"],
        totalSugar: json["totalSugar"],
    );

    Map<String, dynamic> toJson() => {
        "foodHistory": foodHistory == null ? [] : List<dynamic>.from(foodHistory!.map((x) => x.toJson())),
        "waterHistory": waterHistory == null ? [] : List<dynamic>.from(waterHistory!.map((x) => x)),
        "totalCalories": totalCalories,
        "totalFat": totalFat,
        "totalCarbohydate": totalCarbohydate,
        "totalProtein": totalProtein,
        "totalLitre": totalLitre,
        "totalCaffeine": totalCaffeine,
        "totalSugar": totalSugar,
    };
}

class FoodHistory {
    String? id;
    String? userId;
    String? foodName;
    int? calories;
    int? fat;
    int? carbohydate;
    int? protein;
    DateTime? time;
    int? v;
    String? imgPath;

    FoodHistory({
        this.id,
        this.userId,
        this.foodName,
        this.calories,
        this.fat,
        this.carbohydate,
        this.protein,
        this.time,
        this.v,
        this.imgPath,
    });

    factory FoodHistory.fromJson(Map<String, dynamic> json) => FoodHistory(
        id: json["_id"],
        userId: json["userId"],
        foodName: json["foodName"],
        calories: json["calories"],
        fat: json["fat"],
        carbohydate: json["carbohydate"],
        protein: json["protein"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        v: json["__v"],
        imgPath: json["imgPath"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "foodName": foodName,
        "calories": calories,
        "fat": fat,
        "carbohydate": carbohydate,
        "protein": protein,
        "time": time?.toIso8601String(),
        "__v": v,
        "imgPath": imgPath,
    };
}
