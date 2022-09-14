// To parse this JSON data, do
//
//     final modelViewGeb = modelViewGebFromJson(jsonString);

import 'dart:convert';

List<ModelViewGeb> modelViewGebFromJson(String str) => List<ModelViewGeb>.from(json.decode(str).map((x) => ModelViewGeb.fromJson(x)));

String modelViewGebToJson(List<ModelViewGeb> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelViewGeb {
  ModelViewGeb({
    this.kwh,
    this.kvarh,
    this.kevah,
    this.md,
    this.turbine,
    this.pf,
    this.pfper,
    this.kwhtotal,
    this.kwhtotalper,
    this.mdper,
    this.turbineper,
    this.kvahper,
    this.kvarhper,
  });

  num ? kwh;
  num ? kvarh;
  num ? kevah;
  String ? md;
  num ? turbine;
  num ? pf;
  num ? pfper;
  num ? kwhtotal;
  num ? kwhtotalper;
  num ? mdper;
  num ? turbineper;
  num ? kvahper;
  num ? kvarhper;

  factory ModelViewGeb.fromJson(Map<String, dynamic> json) => ModelViewGeb(
    kwh: json["kwh"],
    kvarh: json["kvarh"],
    kevah: json["kevah"],
    md: json["md"],
    turbine: json["turbine"],
    pf: json["pf"],
    pfper: json["pfper"],
    kwhtotal: json["kwhtotal"],
    kwhtotalper: json["kwhtotalper"],
    mdper: json["mdper"],
    turbineper: json["turbineper"],
    kvahper: json["kvahper"],
    kvarhper: json["kvarhper"],
  );

  Map<String, dynamic> toJson() => {
    "kwh": kwh,
    "kvarh": kvarh,
    "kevah": kevah,
    "md": md,
    "turbine": turbine,
    "pf": pf,
    "pfper": pfper,
    "kwhtotal": kwhtotal,
    "kwhtotalper": kwhtotalper,
    "mdper": mdper,
    "turbineper": turbineper,
    "kvahper": kvahper,
    "kvarhper": kvarhper,
  };
}
