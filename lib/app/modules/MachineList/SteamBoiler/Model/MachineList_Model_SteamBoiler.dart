import 'dart:convert';

List<ModelSteamBoiler> modelSteamBoilerFromJson(String str) =>
    List<ModelSteamBoiler>.from(
        json.decode(str).map((x) => ModelSteamBoiler.fromJson(x)));

String modelSteamBoilerToJson(List<ModelSteamBoiler> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSteamBoiler {
  ModelSteamBoiler({
    this.id,
    required this.bfw,
    required this.temperature,
    required this.bfwPercentage,
    required this.bfwTemperaturePercentage,
    required this.coal1,
    required this.coal2,
    required this.coalDeviation1,
    required this.coalDeviation2,
    required this.rateOfCoal1,
    required this.rateOfCoal2,
    required this.steamCost,
    required this.steamCostPercentage,
  });

  int? id;
  int bfw;
  int temperature;
  int bfwPercentage;
  int bfwTemperaturePercentage;
  int coal1;
  int coal2;
  int coalDeviation1;
  int coalDeviation2;
  int rateOfCoal1;
  int rateOfCoal2;
  int steamCost;
  int steamCostPercentage;

  factory ModelSteamBoiler.fromJson(Map<String, dynamic> json) =>
      ModelSteamBoiler(
        id: json["id"],
        bfw: json["bfw"],
        temperature: json["temperature"],
        bfwPercentage: json["bfw_percentage"],
        bfwTemperaturePercentage: json["bfw_temperature_percentage"],
        coal1: json["coal_1"],
        coal2: json["coal_2"],
        coalDeviation1: json["coal_deviation_1"],
        coalDeviation2: json["coal_deviation_2"],
        rateOfCoal1: json["rate_of_coal_1"],
        rateOfCoal2: json["rate_of_coal_2"],
        steamCost: json["steam_cost"],
        steamCostPercentage: json["steam_cost_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bfw": bfw,
        "temperature": temperature,
        "bfw_percentage": bfwPercentage,
        "bfw_temperature_percentage": bfwTemperaturePercentage,
        "coal_1": coal1,
        "coal_2": coal2,
        "coal_deviation_1": coalDeviation1,
        "coal_deviation_2": coalDeviation2,
        "rate_of_coal_1": rateOfCoal1,
        "rate_of_coal_2": rateOfCoal2,
        "steam_cost": steamCost,
        "steam_cost_percentage": steamCostPercentage,
      };
}
