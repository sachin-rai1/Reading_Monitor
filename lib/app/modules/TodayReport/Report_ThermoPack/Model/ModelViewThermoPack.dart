// To parse this JSON data, do
//
//     final modelViewThermoPack = modelViewThermoPackFromJson(jsonString);

import 'dart:convert';

List<ModelViewThermoPack> modelViewThermoPackFromJson(String str) => List<ModelViewThermoPack>.from(json.decode(str).map((x) => ModelViewThermoPack.fromJson(x)));

String modelViewThermoPackToJson(List<ModelViewThermoPack> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelViewThermoPack {
  ModelViewThermoPack({
    this.chamber,
    this.pumpPresure,
    this.inTemperature,
    this.col1,
    this.col2,
    this.circuitPresure,
    this.dt,
    this.dtper,
    this.coal1,
    this.coal2,
    this.cc,
    this.ccper,
  });

  String ? chamber;
  String ? pumpPresure;
  String ? inTemperature;
  String ? col1;
  String ? col2;
  String ? circuitPresure;
  int ? dt;
  int ? dtper;
  int ? coal1;
  double ? coal2;
  int ? cc;
  double ? ccper;

  factory ModelViewThermoPack.fromJson(Map<String, dynamic> json) => ModelViewThermoPack(
    chamber: json["chamber"],
    pumpPresure: json["pump_presure"],
    inTemperature: json["in_temperature"],
    col1: json["col1"],
    col2: json["col2"],
    circuitPresure: json["circuit_presure"],
    dt: json["dt"],
    dtper: json["dtper"],
    coal1: json["coal_1"],
    coal2: json["coal_2"].toDouble(),
    cc: json["cc"],
    ccper: json["ccper"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "chamber": chamber,
    "pump_presure": pumpPresure,
    "in_temperature": inTemperature,
    "col1": col1,
    "col2": col2,
    "circuit_presure": circuitPresure,
    "dt": dt,
    "dtper": dtper,
    "coal_1": coal1,
    "coal_2": coal2,
    "cc": cc,
    "ccper": ccper,
  };
}
