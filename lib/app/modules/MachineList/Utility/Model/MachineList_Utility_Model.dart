import 'dart:convert';

List<ModelMachineList> modelMachineListFromJson(String str) =>
    List<ModelMachineList>.from(
        json.decode(str).map((x) => ModelMachineList.fromJson(x)));

String modelMachineListToJson(List<ModelMachineList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelMachineList {
  ModelMachineList({
    this.id,
    this.uid,
    required this.categories,
    this.flage,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic uid;
  String categories;
  int? flage;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ModelMachineList.fromJson(Map<String, dynamic> json) =>
      ModelMachineList(
        id: json["id"],
        uid: json["uid"],
        categories: json["categories"],
        flage: json["flage"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "categories": categories,
        "flage": flage,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
