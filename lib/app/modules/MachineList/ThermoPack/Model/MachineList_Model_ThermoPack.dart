import 'dart:convert';

List<ThermoPack> thermoPackFromJson(String str) => List<ThermoPack>.from(json.decode(str).map((x) => ThermoPack.fromJson(x)));

String thermoPackToJson(List<ThermoPack> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ThermoPack {
  ThermoPack({
    this.id,
    this.uid,
    required this.coal1,
    required this.coal1Dev,
    required this.rateOfCoal1,
    required this.coal2,
    required this.coal2Dev,
    required this.rateOfCoal2,
    required this.deltaT1,
    required this.deltaT2,
    required this.chamberCost1,
    required this.chamberCost2,
    this.flage,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic uid;
  int coal1;
  int coal1Dev;
  int rateOfCoal1;
  int coal2;
  int coal2Dev;
  int rateOfCoal2;
  int deltaT1;
  int deltaT2;
  int chamberCost1;
  int chamberCost2;
  int ? flage;
  dynamic deletedAt;
  DateTime ? createdAt;
  DateTime ? updatedAt;

  factory ThermoPack.fromJson(Map<String, dynamic> json) => ThermoPack(
    id: json["id"],
    uid: json["uid"],
    coal1: json["coal1"],
    coal1Dev: json["coal1_dev"],
    rateOfCoal1: json["rate_of_coal1"],
    coal2: json["coal2"],
    coal2Dev: json["coal2_dev"],
    rateOfCoal2: json["rate_of_coal2"],
    deltaT1: json["delta_t1"],
    deltaT2: json["delta_t2"],
    chamberCost1: json["chamber_cost1"],
    chamberCost2: json["chamber_cost2"],
    flage: json["flage"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "coal1": coal1,
    "coal1_dev": coal1Dev,
    "rate_of_coal1": rateOfCoal1,
    "coal2": coal2,
    "coal2_dev": coal2Dev,
    "rate_of_coal2": rateOfCoal2,
    "delta_t1": deltaT1,
    "delta_t2": deltaT2,
    "chamber_cost1": chamberCost1,
    "chamber_cost2": chamberCost2,
    "flage": flage,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
