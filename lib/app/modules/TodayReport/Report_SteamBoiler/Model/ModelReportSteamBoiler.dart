// To parse this JSON data, do
//
//     final modelReportSteamBoiler = modelReportSteamBoilerFromJson(jsonString);

import 'dart:convert';

List<ModelReportSteamBoiler> modelReportSteamBoilerFromJson(String str) =>
    List<ModelReportSteamBoiler>.from(
        json.decode(str).map((x) => ModelReportSteamBoiler.fromJson(x)));

String modelReportSteamBoilerToJson(List<ModelReportSteamBoiler> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelReportSteamBoiler {
  ModelReportSteamBoiler({
    this.bfw,
    this.bfwTemperature,
    this.coal1,
    this.coal2,
    this.bfwper,
    this.tempper,
    this.sc,
    this.scper,
    this.coal1Per,
    this.coal2Per,
  });

  String? bfw;
  String? bfwTemperature;
  String? coal1;
  String? coal2;
  num? bfwper;
  num? tempper;
  num? sc;
  num? scper;
  num? coal1Per;
  num? coal2Per;

  factory ModelReportSteamBoiler.fromJson(Map<String, dynamic> json) =>
      ModelReportSteamBoiler(
        bfw: json["bfw"],
        bfwTemperature: json["bfw_temperature"],
        coal1: json["coal_1"],
        coal2: json["coal_2"],
        bfwper: json["bfwper"],
        tempper: json["tempper"],
        sc: json["sc"],
        scper: json["scper"],
        coal1Per: json["coal_1per"],
        coal2Per: json["coal_2per"],
      );

  Map<String, dynamic> toJson() => {
        "bfw": bfw,
        "bfw_temperature": bfwTemperature,
        "coal_1": coal1,
        "coal_2": coal2,
        "bfwper": bfwper,
        "tempper": tempper,
        "sc": sc,
        "scper": scper,
        "coal_1per": coal1Per,
        "coal_2per": coal2Per,
      };
}
