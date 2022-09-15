import 'dart:convert';

List<ModelThermoPack> modelThermoPackFromJson(String str) =>
    List<ModelThermoPack>.from(
        json.decode(str).map((x) => ModelThermoPack.fromJson(x)));

String modelThermoPackToJson(List<ModelThermoPack> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelThermoPack {
  ModelThermoPack({
    this.id,
    required this.coal1,
    required this.coalDeviation1,
    required this.rateOfCloal1,
    required this.coal2,
    required this.coalDeviation2,
    required this.rateOfCoal2,
    required this.delta,
    required this.deltaTPercentage,
    required this.chamberCost,
    required this.chamberCostPercentage,
  });

  int? id;
  int coal1;
  int coalDeviation1;
  int rateOfCloal1;
  int coal2;
  int coalDeviation2;
  int rateOfCoal2;
  int delta;
  int deltaTPercentage;
  int chamberCost;
  int chamberCostPercentage;

  factory ModelThermoPack.fromJson(Map<String, dynamic> json) =>
      ModelThermoPack(
        id: json["id"],
        coal1: json["coal_1"],
        coalDeviation1: json["coal_deviation1"],
        rateOfCloal1: json["rate_of_cloal1"],
        coal2: json["coal_2"],
        coalDeviation2: json["coal_deviation2"],
        rateOfCoal2: json["rate_of_coal2"],
        delta: json["delta_t"],
        deltaTPercentage: json["delta_t_percentage"],
        chamberCost: json["chamber_cost"],
        chamberCostPercentage: json["chamber_cost_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coal_1": coal1,
        "coal_deviation1": coalDeviation1,
        "rate_of_cloal1": rateOfCloal1,
        "coal_2": coal2,
        "coal_deviation2": coalDeviation2,
        "rate_of_coal2": rateOfCoal2,
        "delta_t": delta,
        "delta_t_percentage": deltaTPercentage,
        "chamber_cost": chamberCost,
        "chamber_cost_percentage": chamberCostPercentage,
      };
}
