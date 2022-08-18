import 'dart:convert';

List<GebModel> gebModelFromJson(String str) => List<GebModel>.from(json.decode(str).map((x) => GebModel.fromJson(x)));

String gebModelToJson(List<GebModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GebModel {
  GebModel({
    this.id,
   required this.kwh,
   required this.kwmDeviation,
   required this.kvarh,
   required this.kvarshDeviation,
   required this.kevah,
   required this.kevahDeviation,
   required this.pf,
   required this.pfDeviation,
   required this.md,
   required this.mdDeviation,
   required this.turbine,
   required this.turbineDeviation,
   required this.mf,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int ? id;
  int kwh;
  int kwmDeviation;
  int kvarh;
  int kvarshDeviation;
  int kevah;
  int kevahDeviation;
  int pf;
  int pfDeviation;
  int md;
  int mdDeviation;
  int turbine;
  int turbineDeviation;
  int mf;
  int ? status;
  DateTime ? createdAt;
  DateTime ? updatedAt;
  dynamic deletedAt;

  factory GebModel.fromJson(Map<String, dynamic> json) => GebModel(
    id: json["id"],
    kwh: json["kwh"],
    kwmDeviation: json["kwm_deviation"],
    kvarh: json["kvarh"],
    kvarshDeviation: json["kvarsh_deviation"],
    kevah: json["kevah"],
    kevahDeviation: json["kevah_deviation"],
    pf: json["pf"],
    pfDeviation: json["pf_deviation"],
    md: json["md"],
    mdDeviation: json["md_deviation"],
    turbine: json["turbine"],
    turbineDeviation: json["turbine_deviation"],
    mf: json["mf"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kwh": kwh,
    "kwm_deviation": kwmDeviation,
    "kvarh": kvarh,
    "kvarsh_deviation": kvarshDeviation,
    "kevah": kevah,
    "kevah_deviation": kevahDeviation,
    "pf": pf,
    "pf_deviation": pfDeviation,
    "md": md,
    "md_deviation": mdDeviation,
    "turbine": turbine,
    "turbine_deviation": turbineDeviation,
    "mf": mf,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
