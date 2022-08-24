import 'dart:convert';

List<ModelUtilitySubMachineList> modelUtilitySubMachineListFromJson(
        String str) =>
    List<ModelUtilitySubMachineList>.from(
        json.decode(str).map((x) => ModelUtilitySubMachineList.fromJson(x)));

String modelUtilitySubMachineListToJson(
        List<ModelUtilitySubMachineList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUtilitySubMachineList {
  ModelUtilitySubMachineList({
    this.id,
    required this.uilitysubcName,
    this.uitilityCategoriesId,
    required this.average,
    required this.deviation,
  });

  int? id;
  String uilitysubcName;
  int? uitilityCategoriesId;
  int average;
  int deviation;

  factory ModelUtilitySubMachineList.fromJson(Map<String, dynamic> json) =>
      ModelUtilitySubMachineList(
        id: json["id"],
        uilitysubcName: json["uilitysubc_name"],
        uitilityCategoriesId: json["uitility_categories_id"],
        average: json["average"],
        deviation: json["deviation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uilitysubc_name": uilitysubcName,
        "uitility_categories_id": uitilityCategoriesId,
        "average": average,
        "deviation": deviation,
      };
}
