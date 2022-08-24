import 'dart:convert';

List<ModelManoMeterThermoPack> modelManoMeterThermoPackFromJson(String str) =>
    List<ModelManoMeterThermoPack>.from(
        json.decode(str).map((x) => ModelManoMeterThermoPack.fromJson(x)));

String modelManoMeterThermoPackToJson(List<ModelManoMeterThermoPack> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelManoMeterThermoPack {
  ModelManoMeterThermoPack({
    this.id,
    required this.thermopack,
  });

  int? id;
  String thermopack;

  factory ModelManoMeterThermoPack.fromJson(Map<String, dynamic> json) =>
      ModelManoMeterThermoPack(
        id: json["id"],
        thermopack: json["thermopack"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "thermopack": thermopack,
      };
}
