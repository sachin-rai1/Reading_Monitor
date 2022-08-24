import 'dart:convert';

List<ModelSupplyPump> modelSupplyPumpFromJson(String str) =>
    List<ModelSupplyPump>.from(
        json.decode(str).map((x) => ModelSupplyPump.fromJson(x)));

String modelSupplyPumpToJson(List<ModelSupplyPump> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSupplyPump {
  ModelSupplyPump({
    this.id,
    this.name,
    required this.average,
    required this.deviation,
  });

  int? id;
  String? name;
  int? average;
  int? deviation;

  factory ModelSupplyPump.fromJson(Map<String, dynamic> json) =>
      ModelSupplyPump(
        id: json["id"],
        name: json["name"],
        average: json["average"],
        deviation: json["deviation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "average": average,
        "deviation": deviation,
      };
}
