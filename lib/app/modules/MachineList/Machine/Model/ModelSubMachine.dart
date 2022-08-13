import 'dart:convert';

List<ModelSubMachineList> modelSubMachineListFromJson(String str) => List<ModelSubMachineList>.from(json.decode(str).map((x) => ModelSubMachineList.fromJson(x)));

String modelSubMachineListToJson(List<ModelSubMachineList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSubMachineList {
  ModelSubMachineList({
    this.id,
    this.uid,
   required this.categoriesId,
   required this.name,
   required this.emHm1,
   required this.emHm2,
   required this.waterBatch1,
   required this.waterBatch2,
    this.flage,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int ? id;
  dynamic uid;
  int categoriesId;
  String name;
  int emHm1;
  int emHm2;
  int waterBatch1;
  int waterBatch2;
  int ? flage;
  dynamic deletedAt;
  DateTime ? createdAt;
  DateTime ? updatedAt;

  factory ModelSubMachineList.fromJson(Map<String, dynamic> json) => ModelSubMachineList(
    id: json["id"],
    uid: json["uid"],
    categoriesId: json["categories_id"],
    name: json["name"],
    emHm1: json["em_hm1"],
    emHm2: json["em_hm2"],
    waterBatch1: json["water_batch1"],
    waterBatch2: json["water_batch2"],
    flage: json["flage"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "categories_id": categoriesId,
    "name": name,
    "em_hm1": emHm1,
    "em_hm2": emHm2,
    "water_batch1": waterBatch1,
    "water_batch2": waterBatch2,
    "flage": flage,
    "deleted_at": deletedAt,
    "created_!at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
