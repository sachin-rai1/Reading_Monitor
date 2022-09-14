// To parse this JSON data, do
//
//     final modelMachineMisc = modelMachineMiscFromJson(jsonString);

import 'dart:convert';

List<ModelMachineMisc> modelMachineMiscFromJson(String str) => List<ModelMachineMisc>.from(json.decode(str).map((x) => ModelMachineMisc.fromJson(x)));

String modelMachineMiscToJson(List<ModelMachineMisc> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelMachineMisc {
  ModelMachineMisc({
    this.id,
    this.machineName,
    this.unit,
    this.deviation,
  });

  int ? id;
  String?  machineName;
  int ?unit;
  int ? deviation;

  factory ModelMachineMisc.fromJson(Map<String, dynamic> json) => ModelMachineMisc(
    id: json["id"],
    machineName: json["machine_name"],
    unit: json["unit"],
    deviation: json["deviation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "machine_name": machineName,
    "unit": unit,
    "deviation": deviation,
  };
}
