import 'dart:convert';

List<ModelUploadSupplyPump> modelUploadSupplyPumpFromJson(String str) =>
    List<ModelUploadSupplyPump>.from(
        json.decode(str).map((x) => ModelUploadSupplyPump.fromJson(x)));

String modelUploadSupplyPumpToJson(List<ModelUploadSupplyPump> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUploadSupplyPump {
  ModelUploadSupplyPump({
    this.id,
    this.date,
    this.name,
    this.supplypNameId,
    this.flow,
    this.unit,
  });

  int? id;
  DateTime? date;
  String? name;
  String? supplypNameId;
  List<String>? flow;
  List<String> ? unit;

  factory ModelUploadSupplyPump.fromJson(Map<String, dynamic> json) =>
      ModelUploadSupplyPump(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        supplypNameId: json["supplyp_name_id"],
        flow: json["flow"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "name": name,
        "supplyp_name_id": supplypNameId,
        "flow": flow,
        "unit": unit,
      };
}
