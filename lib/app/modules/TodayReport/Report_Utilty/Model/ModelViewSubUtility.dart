import 'dart:convert';

List<ModelViewSubUtility> modelViewSubUtilityFromJson(String str) => List<ModelViewSubUtility>.from(json.decode(str).map((x) => ModelViewSubUtility.fromJson(x)));
String modelViewSubUtilityToJson(List<ModelViewSubUtility> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelViewSubUtility {
  ModelViewSubUtility({
    this.em,
    this.hm,
    this.average,
    this.dev,
    this.categoryName,
    this.subCategoryName,
    this.averageOne,
  });

  num ? em;
  num ? hm;
  num ? average;
  num ? dev;
  String ? categoryName;
  String ? subCategoryName;
  int ? averageOne;

  factory ModelViewSubUtility.fromJson(Map<String, dynamic> json) => ModelViewSubUtility(
    em: json["em"],
    hm: json["hm"],
    average: json["average"],
    dev: json["dev"],
    categoryName: json["CategoryName"],
    subCategoryName: json["SubCategoryName"],
    averageOne: json["averageOne"],
  );

  Map<String, dynamic> toJson() => {
    "em": em,
    "hm": hm,
    "average": average,
    "dev": dev,
    "CategoryName": categoryName,
    "SubCategoryName": subCategoryName,
    "averageOne": averageOne,
  };
}
