import 'dart:convert';

List<ModelFlueGasSteamBoiler> modelFlueGasSteamBoilerFromJson(String str) => List<ModelFlueGasSteamBoiler>.from(json.decode(str).map((x) => ModelFlueGasSteamBoiler.fromJson(x)));

String modelFlueGasSteamBoilerToJson(List<ModelFlueGasSteamBoiler> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelFlueGasSteamBoiler {
  ModelFlueGasSteamBoiler({
    this.id,
    this.userId,
    this.machineName,
    this.value,
    this.deviation,
    this.temperature,
    this.temperatureDeviation,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int ? id;
  int ? userId;
  String ? machineName;
  num ? value;
  num ? deviation;
  num ? temperature;
  num ? temperatureDeviation;
  num ? status;
  DateTime ?createdAt;
  DateTime ? updatedAt;
  dynamic deletedAt;

  factory ModelFlueGasSteamBoiler.fromJson(Map<String, dynamic> json) => ModelFlueGasSteamBoiler(
    id: json["id"],
    userId: json["user_id"],
    machineName: json["machine_name"],
    value: json["value"],
    deviation: json["deviation"],
    temperature: json["temperature"],
    temperatureDeviation: json["temperature_deviation"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "machine_name": machineName,
    "value": value,
    "deviation": deviation,
    "temperature": temperature,
    "temperature_deviation": temperatureDeviation,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
