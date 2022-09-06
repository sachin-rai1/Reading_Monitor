// To parse this JSON data, do
//
//     final modelViewUtility = modelViewUtilityFromJson(jsonString);

import 'dart:convert';

List<ModelViewUtility> modelViewUtilityFromJson(String str) => List<ModelViewUtility>.from(json.decode(str).map((x) => ModelViewUtility.fromJson(x)));

String modelViewUtilityToJson(List<ModelViewUtility> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelViewUtility {
  ModelViewUtility({
    this.em,
    this.hm,
    this.uitilityCategoriesId,
    this.uitilitySubcategoriesId,
  });

  int ? em;
  int ? hm;
  String ? uitilityCategoriesId;
  String ? uitilitySubcategoriesId;

  factory ModelViewUtility.fromJson(Map<String, dynamic> json) => ModelViewUtility(
    em: json["em"],
    hm: json["hm"],
    uitilityCategoriesId: json["uitility_categories_id"],
    uitilitySubcategoriesId: json["uitility_subcategories_id"],
  );

  Map<String, dynamic> toJson() => {
    "em": em,
    "hm": hm,
    "uitility_categories_id": uitilityCategoriesId,
    "uitility_subcategories_id": uitilitySubcategoriesId,
  };
}

