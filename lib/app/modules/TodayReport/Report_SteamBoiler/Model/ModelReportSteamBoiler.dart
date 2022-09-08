import 'dart:convert';

List<ModelReportSteamBoiler> modelReportSteamBoilerFromJson(String str) => List<ModelReportSteamBoiler>.from(json.decode(str).map((x) => ModelReportSteamBoiler.fromJson(x)));

String modelReportSteamBoilerToJson(List<ModelReportSteamBoiler> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelReportSteamBoiler {
  ModelReportSteamBoiler({
    this.steambolierId,
    this.bfwone,
    this.bfwonePercentage,
    this.coal1,
    this.coal1Percentage,
    this.coal2,
    this.coal2Percentage,
    this.sc,
    this.scPercentage,
    this.bfwTemperatureUpload,
    this.bfwtemperaturepercentage
  });

  int ? steambolierId;
  int ? bfwone;
  int ? bfwonePercentage;
  int ? coal1;
  int ? coal1Percentage;
  int ? coal2;
  int ? coal2Percentage;
  int ? sc;
  int ? scPercentage;
  double ? bfwTemperatureUpload;
  double ? bfwtemperaturepercentage;

  factory ModelReportSteamBoiler.fromJson(Map<String, dynamic> json) => ModelReportSteamBoiler(
    steambolierId: json["steambolier_id"],
    bfwone: json["bfwone"],
    bfwonePercentage: json["bfwone_percentage"],
    coal1: json["coal_1"],
    coal1Percentage: json["coal1_percentage"],
    coal2: json["coal_2"],
    coal2Percentage: json["coal2_percentage"],
    sc: json["sc"],
    scPercentage: json["sc_percentage"],
    bfwTemperatureUpload: json["bfw_temperatureUpload"],
    bfwtemperaturepercentage : json["bfw_temperaturepercentage"],
  );

  Map<String, dynamic> toJson() => {
    "steambolier_id": steambolierId,
    "bfwone": bfwone,
    "bfwone_percentage": bfwonePercentage,
    "coal_1": coal1,
    "coal1_percentage": coal1Percentage,
    "coal_2": coal2,
    "coal2_percentage": coal2Percentage,
    "sc": sc,
    "sc_percentage": scPercentage,
    "bfw_temperatureUpload": bfwTemperatureUpload,
    "bfw_temperaturepercentage" :bfwtemperaturepercentage,
  };
}
