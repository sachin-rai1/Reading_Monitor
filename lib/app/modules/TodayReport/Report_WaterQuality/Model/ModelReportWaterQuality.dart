import 'dart:convert';

List<ModelReportWaterQuality> modelReportWaterQualityFromJson(String str) => List<ModelReportWaterQuality>.from(json.decode(str).map((x) => ModelReportWaterQuality.fromJson(x)));

String modelReportWaterQualityToJson(List<ModelReportWaterQuality> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelReportWaterQuality {
  ModelReportWaterQuality({
    this.machineNameId,
    this.machineName,
    this.tds,
    this.tdsPercentage,
    this.ph,
    this.phPercentage,
    this.hardness,
    this.hardnessPercentage,
  });

  int    ? machineNameId;
  String ? machineName;
  int    ? tds;
  double ? tdsPercentage;
  double ? ph;
  double ?  phPercentage;
  int    ?     hardness;
  double ? hardnessPercentage;

  factory ModelReportWaterQuality.fromJson(Map<String, dynamic> json) => ModelReportWaterQuality(
    machineNameId: json["machine_name_id"],
    machineName: json["machine_name"],
    tds: json["tds"],
    tdsPercentage: json["tds_percentage"].toDouble(),
    ph: json["ph"].toDouble(),
    phPercentage: json["ph_percentage"].toDouble(),
    hardness: json["hardness"],
    hardnessPercentage: json["hardness_percentage"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "machine_name_id": machineNameId,
    "machine_name": machineName,
    "tds": tds,
    "tds_percentage": tdsPercentage,
    "ph": ph,
    "ph_percentage": phPercentage,
    "hardness": hardness,
    "hardness_percentage": hardnessPercentage,
  };
}
