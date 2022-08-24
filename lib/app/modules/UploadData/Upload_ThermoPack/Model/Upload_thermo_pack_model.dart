import 'dart:convert';

List<ModelUploadThermoPack> modelUploadThermoPackFromJson(String str) => List<ModelUploadThermoPack>.from(json.decode(str).map((x) => ModelUploadThermoPack.fromJson(x)));

String modelUploadThermoPackToJson(List<ModelUploadThermoPack> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUploadThermoPack {
  ModelUploadThermoPack({
    this.id,
    this.date,
   required this.chamber,
   required this.coal1,
   required this.coal2,
   required this.inTemperature,
   required this.outTemperature,
   required this.pumpPresure,
   required this.circuitPresure,
  });

  int ? id;
  DateTime ? date;
  int chamber;
  int coal1;
  int coal2;
  int inTemperature;
  int outTemperature;
  int pumpPresure;
  int circuitPresure;

  factory ModelUploadThermoPack.fromJson(Map<String, dynamic> json) => ModelUploadThermoPack(
    id: json["id"],
    date: json["date"],
    chamber: json["chamber"],
    coal1: json["coal_1"],
    coal2: json["coal_2"],
    inTemperature: json["in_temperature"],
    outTemperature: json["out_temperature"],
    pumpPresure: json["pump_presure"],
    circuitPresure: json["circuit_presure"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "chamber": chamber,
    "coal_1": coal1,
    "coal_2": coal2,
    "in_temperature": inTemperature,
    "out_temperature": outTemperature,
    "pump_presure": pumpPresure,
    "circuit_presure": circuitPresure,
  };
}
