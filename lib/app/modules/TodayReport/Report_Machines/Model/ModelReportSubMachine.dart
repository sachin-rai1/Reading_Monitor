import 'dart:convert';

List<ModelReportSubMachine> modelReportSubMachineFromJson(String str) => List<ModelReportSubMachine>.from(json.decode(str).map((x) => ModelReportSubMachine.fromJson(x)));

String modelReportSubMachineToJson(List<ModelReportSubMachine> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelReportSubMachine {
  ModelReportSubMachine({
    this.em,
    this.hm,
    this.water,
    this.batch,
    this.dev,
    this.waterbatch,
    this.weterper,
    this.average,
    this.categoryName,
    this.subCategoryName,
  });

  num ? em;
  num ? hm;
  num ? water;
  String ? batch;
  num ? dev;
  num ? waterbatch;
  num ? weterper;
  num ? average;
  String ? categoryName;
  String ? subCategoryName;

  factory ModelReportSubMachine.fromJson(Map<String, dynamic> json) => ModelReportSubMachine(
    em: json["em"],
    hm: json["hm"],
    water: json["water"],
    batch: json["batch"],
    dev: json["dev"],
    waterbatch: json["waterbatch"],
    weterper: json["weterper"],
    average: json["average"].toDouble(),
    categoryName: json["CategoryName"],
    subCategoryName: json["SubCategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "em": em,
    "hm": hm,
    "water": water,
    "batch": batch,
    "dev": dev,
    "waterbatch": waterbatch,
    "weterper": weterper,
    "average": average,
    "CategoryName": categoryName,
    "SubCategoryName": subCategoryName,
  };
}
