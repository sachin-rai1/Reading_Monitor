import 'dart:convert';

List<ModelViewUtility> modelViewUtilityFromJson(String str) =>
    List<ModelViewUtility>.from(
        json.decode(str).map((x) => ModelViewUtility.fromJson(x)));

String modelViewUtilityToJson(List<ModelViewUtility> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelViewUtility {
  ModelViewUtility(
      {this.em,
      this.hm,
      this.average,
      this.dev,
      this.categoryId,
      this.uitilityCategories});

  num? em;
  num? hm;
  num? average;
  num? dev;
  num? categoryId;
  String? uitilityCategories;

  factory ModelViewUtility.fromJson(Map<String, dynamic> json) =>
      ModelViewUtility(
        em: json["em"],
        hm: json["hm"],
        average: json["average"],
        dev: json["dev"],
        categoryId: json["CategoryId"],
        uitilityCategories: json["uitility_categories"],
      );

  Map<String, dynamic> toJson() => {
        "em": em,
        "hm": hm,
        "average": average,
        "dev": dev,
        "CategoryId": categoryId,
        "uitility_categories": uitilityCategories,
      };
}
