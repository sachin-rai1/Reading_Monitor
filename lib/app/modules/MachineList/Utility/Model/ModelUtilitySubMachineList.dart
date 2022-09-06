// To parse this JSON data, do
//
//     final modelUtilitySubMachineList = modelUtilitySubMachineListFromJson(jsonString);

import 'dart:convert';

List<ModelUtilitySubMachineList> modelUtilitySubMachineListFromJson(String str) => List<ModelUtilitySubMachineList>.from(json.decode(str).map((x) => ModelUtilitySubMachineList.fromJson(x)));

String modelUtilitySubMachineListToJson(List<ModelUtilitySubMachineList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUtilitySubMachineList {
  ModelUtilitySubMachineList({
    this.id,
    this.userId,
    this.uitilityCategoriesId,
    this.uilitysubcName,
    this.average,
    this.deviation,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int ? id;
  int ? userId;
  int ? uitilityCategoriesId;
  String ? uilitysubcName;
  int ? average;
  int ? deviation;
  int ? status;
  DateTime ? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory ModelUtilitySubMachineList.fromJson(Map<String, dynamic> json) => ModelUtilitySubMachineList(
    id: json["id"],
    userId: json["user_id"],
    uitilityCategoriesId: json["uitility_categories_id"],
    uilitysubcName: json["uilitysubc_name"],
    average: json["average"],
    deviation: json["deviation"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "uitility_categories_id": uitilityCategoriesId,
    "uilitysubc_name": uilitysubcName,
    "average": average,
    "deviation": deviation,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
