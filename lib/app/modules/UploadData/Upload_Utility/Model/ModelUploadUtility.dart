import 'dart:convert';

List<ModelUploadUtility> modelUploadUtilityFromJson(String str) => List<ModelUploadUtility>.from(json.decode(str).map((x) => ModelUploadUtility.fromJson(x)));

String modelUploadUtilityToJson(List<ModelUploadUtility> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUploadUtility {
  ModelUploadUtility({
    this.id,
    this.date,
    this.em,
    this.uitilitySubcategoriesId,
    this.hm,
    this.uilitysubcName,
    this.uitilityCategoriesId,
    this.uitilityCategories,
  });

  int ? id;
  DateTime ? date;
  String ? em;
  int ? uitilitySubcategoriesId;
  String ? hm;
  String ? uilitysubcName;
  int ? uitilityCategoriesId;
  String ? uitilityCategories;

  factory ModelUploadUtility.fromJson(Map<String, dynamic> json) => ModelUploadUtility(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    em: json["em"],
    uitilitySubcategoriesId: json["uitility_subcategories_id"],
    hm: json["hm"],
    uilitysubcName: json["uilitysubc_name"],
    uitilityCategoriesId: json["uitility_categories_id"],
    uitilityCategories: json["uitility_categories"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "em": em,
    "uitility_subcategories_id": uitilitySubcategoriesId,
    "hm": hm,
    "uilitysubc_name": uilitysubcName,
    "uitility_categories_id": uitilityCategoriesId,
    "uitility_categories": uitilityCategories,
  };
}
