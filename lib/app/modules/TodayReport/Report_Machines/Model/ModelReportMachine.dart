// To parse this JSON data, do
//
//     final modelReportMachine = modelReportMachineFromJson(jsonString);

import 'dart:convert';

List<ModelReportMachine> modelReportMachineFromJson(String str) => List<ModelReportMachine>.from(json.decode(str).map((x) => ModelReportMachine.fromJson(x)));

String modelReportMachineToJson(List<ModelReportMachine> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelReportMachine {
  ModelReportMachine({
    this.em,
    this.hm,
    this.average,
    this.water,
    this.dev,
    this.batch,
    this.waterbatch,
    this.weterper,
    this.categoryId,
    this.categories,
  });

  num ? em;
  num ? hm;
  num ? average;
  num ? water;
  num ? dev;
  num ? batch;
  num ? waterbatch;
  num ? weterper;
  num ? categoryId;
  String ? categories;

  factory ModelReportMachine.fromJson(Map<String, dynamic> json) => ModelReportMachine(
    em: json["em"],
    hm: json["hm"],
    average: json["average"],
    water: json["water"],
    dev: json["dev"],
    batch: json["batch"],
    waterbatch: json["waterbatch"],
    weterper: json["weterper"],
    categoryId: json["CategoryId"],
    categories: json["categories"],
  );

  Map<String, dynamic> toJson() => {
    "em": em,
    "hm": hm,
    "average": average,
    "water": water,
    "dev": dev,
    "batch": batch,
    "waterbatch": waterbatch,
    "weterper": weterper,
    "CategoryId": categoryId,
    "categories": categories,
  };
}
