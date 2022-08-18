import 'dart:convert';

List<ModelUtilityMachineList> modelUtilityMachineListFromJson(String str) => List<ModelUtilityMachineList>.from(json.decode(str).map((x) => ModelUtilityMachineList.fromJson(x)));
String modelUtilityMachineListToJson(List<ModelUtilityMachineList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUtilityMachineList {
  ModelUtilityMachineList({
    this.id,
     this.uitilityCategories,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int ? id;
  String ? uitilityCategories;
  int ? status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory ModelUtilityMachineList.fromJson(Map<String, dynamic> json) => ModelUtilityMachineList(
    id: json["id"],
    uitilityCategories: json["uitility_categories"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uitility_categories": uitilityCategories,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
