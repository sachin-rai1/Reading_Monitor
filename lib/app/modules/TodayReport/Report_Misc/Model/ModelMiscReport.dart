// To parse this JSON data, do
//
//     final modelViewMisc = modelViewMiscFromJson(jsonString);

import 'dart:convert';

List<ModelViewMisc> modelViewMiscFromJson(String str) => List<ModelViewMisc>.from(json.decode(str).map((x) => ModelViewMisc.fromJson(x)));

String modelViewMiscToJson(List<ModelViewMisc> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelViewMisc {
  ModelViewMisc({
    this.unitTableReport,
    this.dev,
    this.unit,
    this.categoryName,
    this.unitMachine,
  });

  num ? unitTableReport;
  num ? dev;
  num ? unit;
  String  ? categoryName;
  num ? unitMachine;

  factory ModelViewMisc.fromJson(Map<String, dynamic> json) => ModelViewMisc(
    unitTableReport: json["unitTableReport"],
    dev: json["dev"],
    unit: json["unit"],
    categoryName: json["CategoryName"],
    unitMachine: json["UnitMachine"],
  );

  Map<String, dynamic> toJson() => {
    "unitTableReport": unitTableReport,
    "dev": dev,
    "unit": unit,
    "CategoryName": categoryName,
    "UnitMachine": unitMachine,
  };
}
