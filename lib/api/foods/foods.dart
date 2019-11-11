// To parse this JSON data, do
//
//     final foods = foodsFromJson(jsonString);

import 'dart:convert';

List<Foods> foodsFromJson(String str) => List<Foods>.from(json.decode(str).map((x) => Foods.fromJson(x)));

String foodsToJson(List<Foods> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Foods {
    String foodId;
    String foodTitle;
    String foodImgUrl;
    String foodPuan;
    String foodCat;
    String foodSubCat;
    String foodAdress;

    Foods({
        this.foodId,
        this.foodTitle,
        this.foodImgUrl,
        this.foodPuan,
        this.foodCat,
        this.foodSubCat,
        this.foodAdress,
    });

    factory Foods.fromJson(Map<String, dynamic> json) => Foods(
        foodId: json["foodId"],
        foodTitle: json["foodTitle"],
        foodImgUrl: json["foodImgUrl"],
        foodPuan: json["foodPuan"],
        foodCat: json["foodCat"],
        foodSubCat: json["foodSubCat"],
        foodAdress: json["foodAdress"],
    );

    Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "foodTitle": foodTitle,
        "foodImgUrl": foodImgUrl,
        "foodPuan": foodPuan,
        "foodCat": foodCat,
        "foodSubCat": foodSubCat,
        "foodAdress": foodAdress,
    };
}
