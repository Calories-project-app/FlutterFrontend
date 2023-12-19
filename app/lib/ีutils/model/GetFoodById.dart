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
    int? calories;
    DateTime? time;
    int? v;
    int? fat;
    int? carbohydate;
    int? protein;
    String? imgPath;

    FoodHistory({
        this.id,
        this.userId,
        this.foodName,
        this.calories,
        this.time,
        this.v,
        this.fat,
        this.carbohydate,
        this.protein,
        this.imgPath,
    });

    factory FoodHistory.fromJson(Map<String, dynamic> json) => FoodHistory(
        id: json["_id"],
        userId: json["userId"],
        foodName: json["foodName"],
        calories: json["calories"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        v: json["__v"],
        fat: json["fat"],
        carbohydate: json["carbohydate"],
        protein: json["protein"],
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
        "carbohydate": carbohydate,
        "protein": protein,
        "imgPath": imgPath,
    };
}
