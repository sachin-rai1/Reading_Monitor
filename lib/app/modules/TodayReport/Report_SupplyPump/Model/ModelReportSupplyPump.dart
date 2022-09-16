// To parse this JSON data, do
//
//     final modelReportSupplypump = modelReportSupplypumpFromJson(jsonString);

import 'dart:convert';

List<ModelReportSupplypump> modelReportSupplypumpFromJson(String str) => List<ModelReportSupplypump>.from(json.decode(str).map((x) => ModelReportSupplypump.fromJson(x)));

String modelReportSupplypumpToJson(List<ModelReportSupplypump> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelReportSupplypump {
  ModelReportSupplypump({
    this.flow,
    this.unit,
    this.average,
    this.dev,
    this.categoryName,
    this.deviation,
  });

  num? flow;
  num? unit;
  num? average;
  num? dev;
  String ?  categoryName;
  num ? deviation;

  factory ModelReportSupplypump.fromJson(Map<String, dynamic> json) => ModelReportSupplypump(
    flow: json["flow"],
    unit: json["unit"],
    average: json["average"],
    dev: json["dev"],
    categoryName: json["CategoryName"],
    deviation: json["deviation"],
  );

  Map<String, dynamic> toJson() => {
    "flow": flow,
    "unit": unit,
    "average": average,
    "dev": dev,
    "CategoryName": categoryName,
    "deviation": deviation,
  };
}
