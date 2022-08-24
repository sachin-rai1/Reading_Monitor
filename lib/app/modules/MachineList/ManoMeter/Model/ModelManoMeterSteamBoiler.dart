import 'dart:convert';

List<ModelManoMeterSteamBoiler> modelManoMeterSteamBoilerFromJson(String str) => List<ModelManoMeterSteamBoiler>.from(json.decode(str).map((x) => ModelManoMeterSteamBoiler.fromJson(x)));

String modelManoMeterSteamBoilerToJson(List<ModelManoMeterSteamBoiler> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelManoMeterSteamBoiler {
  ModelManoMeterSteamBoiler({
    this.id,
    required this.steamBoiler,
  });

  int ? id;
  String steamBoiler;

  factory ModelManoMeterSteamBoiler.fromJson(Map<String, dynamic> json) => ModelManoMeterSteamBoiler(
    id: json["id"],
    steamBoiler: json["steam_boiler"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "steam_boiler": steamBoiler,
  };
}
