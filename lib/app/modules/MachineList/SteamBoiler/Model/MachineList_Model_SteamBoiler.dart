import 'dart:convert';

List<SteamBoiler> steamBoilerFromJson(String str) => List<SteamBoiler>.from(json.decode(str).map((x) => SteamBoiler.fromJson(x)));

String steamBoilerToJson(List<SteamBoiler> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SteamBoiler {
  SteamBoiler({
    this.id,
    this.uid,
   required this.bfw1,
   required this.bfw2,
   required this.coal1,
   required this.coal1Div,
   required this.rateOfCoal1,
   required this.coal2,
   required this.coal2Div,
   required this.rateOfCoal2,
   required this.bfwTemperature1,
   required this.bfwTemperature2,
   required this.steamCost1,
   required this.steamCost2,
    this.flage,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int ? id;
  dynamic uid;
  int bfw1;
  int bfw2;
  int coal1;
  int coal1Div;
  int rateOfCoal1;
  int coal2;
  int coal2Div;
  int rateOfCoal2;
  int bfwTemperature1;
  int bfwTemperature2;
  int steamCost1;
  int steamCost2;
  int ? flage;
  dynamic deletedAt;
  DateTime ? createdAt;
  DateTime ? updatedAt;

  factory SteamBoiler.fromJson(Map<String, dynamic> json) => SteamBoiler(
    id: json["id"],
    uid: json["uid"],
    bfw1: json["bfw1"],
    bfw2: json["bfw2"],
    coal1: json["coal1"],
    coal1Div: json["coal1_div"],
    rateOfCoal1: json["rate_of_coal1"],
    coal2: json["coal2"],
    coal2Div: json["coal2_div"],
    rateOfCoal2: json["rate_of_coal2"],
    bfwTemperature1: json["bfw_temperature1"],
    bfwTemperature2: json["bfw_temperature2"],
    steamCost1: json["steam_cost1"],
    steamCost2: json["steam_cost2"],
    flage: json["flage"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "bfw1": bfw1,
    "bfw2": bfw2,
    "coal1": coal1,
    "coal1_div": coal1Div,
    "rate_of_coal1": rateOfCoal1,
    "coal2": coal2,
    "coal2_div": coal2Div,
    "rate_of_coal2": rateOfCoal2,
    "bfw_temperature1": bfwTemperature1,
    "bfw_temperature2": bfwTemperature2,
    "steam_cost1": steamCost1,
    "steam_cost2": steamCost2,
    "flage": flage,
    "deleted_at": deletedAt,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
