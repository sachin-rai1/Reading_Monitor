// To parse this JSON data, do
//
//     final modelViewUtility = modelViewUtilityFromJson(jsonString);

import 'dart:convert';

List<ModelViewUtility> modelViewUtilityFromJson(String str) => List<ModelViewUtility>.from(json.decode(str).map((x) => ModelViewUtility.fromJson(x)));

String modelViewUtilityToJson(List<ModelViewUtility> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelViewUtility {
  ModelViewUtility({
    this.id,
    this.userId,
    this.date,
    this.uitilityCategoriesId,
    this.uitilitySubcategoriesId,
    this.em,
    this.hm,
    this.uitilityCategories,
    this.uilitysubcName,
    this.average,
    this.deviation,
  });

  int ? id;
  int ? userId;
  DateTime ? date;
  int? uitilityCategoriesId;
  int ?uitilitySubcategoriesId;
  String ?em;
  String ?hm;
  String ?uitilityCategories;
  String ?uilitysubcName;
  int ?average;
  int ?deviation;

  factory ModelViewUtility.fromJson(Map<String, dynamic> json) => ModelViewUtility(
    id: json["id"],
    userId: json["user_id"],
    date: DateTime.parse(json["date"]),
    uitilityCategoriesId: json["uitility_categories_id"],
    uitilitySubcategoriesId: json["uitility_subcategories_id"],
    em: json["em"],
    hm: json["hm"],
    uitilityCategories: json["uitility_categories"],
    uilitysubcName: json["uilitysubc_name"],
    average: json["average"],
    deviation: json["deviation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "date": date,
    "uitility_categories_id": uitilityCategoriesId,
    "uitility_subcategories_id": uitilitySubcategoriesId,
    "em": em,
    "hm": hm,
    "uitility_categories": uitilityCategories,
    "uilitysubc_name": uilitysubcName,
    "average": average,
    "deviation": deviation,
  };
}
