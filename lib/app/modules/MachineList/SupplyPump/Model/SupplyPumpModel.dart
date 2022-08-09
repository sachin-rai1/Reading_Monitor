import 'dart:convert';
List<SupplyPump> supplyPumpFromJson(String str) => List<SupplyPump>.from(json.decode(str).map((x) => SupplyPump.fromJson(x)));

String supplyPumpToJson(List<SupplyPump> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupplyPump {
  SupplyPump({
    this.id,
    this.uid,
    required this.machine,
    required this.average,
    required this.deviation,
    this.flage,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int ? id;
  dynamic  uid;
  String machine;
  int average;
  int deviation;
  int ? flage;
  dynamic deletedAt;
  DateTime ? createdAt;
  DateTime ? updatedAt;

  factory SupplyPump.fromJson(Map<String, dynamic> json) => SupplyPump(
    id: json["id"],
    uid: json["uid"],
    machine: json["machine"],
    average: json["average"],
    deviation: json["deviation"],
    flage: json["flage"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "machine": machine,
    "average": average,
    "deviation": deviation,
    "flage": flage,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
