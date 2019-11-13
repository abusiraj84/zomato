

import 'dart:convert';
import 'package:http/http.dart' as http;

List<Foods> foodsFromJson(String str) => List<Foods>.from(json.decode(str).map((x) => Foods.fromJson(x)));

String foodsToJson(List<Foods> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Foods {
    String id;
    String title;
    String imgUrl;
    String puan;
    String cat;
    String subcat;
    String adress;

    Foods({
        this.id,
        this.title,
        this.imgUrl,
        this.puan,
        this.cat,
        this.subcat,
        this.adress,
    });

    factory Foods.fromJson(Map<String, dynamic> json) => Foods(
        id: json["id"],
        title: json["title"],
        imgUrl: json["imgUrl"],
        puan: json["puan"],
        cat: json["cat"],
        subcat: json["subcat"],
        adress: json["adress"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imgUrl": imgUrl,
        "puan": puan,
        "cat": cat,
        "subcat": subcat,
        "adress": adress,
    };
}



Future<List<Foods>> fetchFoods() async {
  String url = 'http://192.168.1.146/zomato/getfood.php';
  final res = await http.get(url);
  return foodsFromJson(res.body);
}

