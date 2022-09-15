import 'dart:convert';

List<ModelWaterQuality> modelWaterQualityFromJson(String str) => List<ModelWaterQuality>.from(json.decode(str).map((x) => ModelWaterQuality.fromJson(x)));

String modelWaterQualityToJson(List<ModelWaterQuality> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelWaterQuality {
  ModelWaterQuality({
    this.id,
    this.machineName,
    this.tds,
    this.tdsPercentage,
    this.ph,
    this.phDeviation,
    this.hardness,
    this.hardnessPercentage,
    this.deletedAt
  });

  num ? id;
  String ? machineName;
  num ? tds;
  num ? tdsPercentage;
  num ? ph;
  num ? phDeviation;
  num ? hardness;
  num ? hardnessPercentage;
  dynamic  deletedAt;

  factory ModelWaterQuality.fromJson(Map<String, dynamic> json) => ModelWaterQuality(
    id: json["id"],
    machineName: json["machine_name"],
    tds: json["tds"],
    tdsPercentage: json["tds_percentage"],
    ph: json["ph"],
    phDeviation: json["ph_deviation"],
    hardness: json["hardness"],
    hardnessPercentage: json["hardness_percentage"],
    deletedAt: json["deleted_at"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "machine_name": machineName,
    "tds": tds,
    "tds_percentage": tdsPercentage,
    "ph": ph,
    "ph_deviation": phDeviation,
    "hardness": hardness,
    "hardness_percentage": hardnessPercentage,
    "deleted_at": deletedAt,
  };
}
