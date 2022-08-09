import 'dart:convert';

List<UploadThermoPackModel> uploadThermoPackModelFromJson(String str) => List<UploadThermoPackModel>.from(json.decode(str).map((x) => UploadThermoPackModel.fromJson(x)));

String uploadThermoPackModelToJson(List<UploadThermoPackModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UploadThermoPackModel {
  UploadThermoPackModel({
    this.id,
   required this.date,
   required this.chambers,
   required this.coal1,
   required this.coal2,
   required this.inTemperature,
   required this.outTemperature,
   required this.pumpPressure,
   required this.circuitPressure,
    this.createdAt,
    this.updatedAt,
  });

  int ? id;
  DateTime date;
  int chambers;
  int coal1;
  int coal2;
  int inTemperature;
  int outTemperature;
  int pumpPressure;
  int circuitPressure;
  dynamic createdAt;
  DateTime ? updatedAt;

  factory UploadThermoPackModel.fromJson(Map<String, dynamic> json) => UploadThermoPackModel(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    chambers: json["chambers"],
    coal1: json["coal1"],
    coal2: json["coal2"],
    inTemperature: json["in_temperature"],
    outTemperature: json["out_temperature"],
    pumpPressure: json["pump_pressure"],
    circuitPressure: json["circuit_pressure"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "chambers": chambers,
    "coal1": coal1,
    "coal2": coal2,
    "in_temperature": inTemperature,
    "out_temperature": outTemperature,
    "pump_pressure": pumpPressure,
    "circuit_pressure": circuitPressure,
    "created_at": createdAt,
    "updated_at": updatedAt!.toIso8601String(),
  };
}
