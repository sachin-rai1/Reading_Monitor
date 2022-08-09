import 'dart:convert';
List<GebModel> gebModelFromJson(String str) => List<GebModel>.from(json.decode(str).map((x) => GebModel.fromJson(x)));
String gebModelToJson(List<GebModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GebModel {
  GebModel({
    this.id,
    this.uid,
    required this.kwh,
    required this.devKwh,
    required this.kvarh,
    required this.devKvarh,
    required this.kvah,
    required this.devKvah,
    required this.pf,
    required this.devPf,
    required this.md,
    required this.devMd,
    required this.mf,
    required this.tb,
    required this.devTb,
    this.flage,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int ? id;
  dynamic uid;
  int kwh;
  int devKwh;
  int kvarh;
  int devKvarh;
  int kvah;
  int devKvah;
  int pf;
  int devPf;
  int md;
  int devMd;
  int mf;
  int tb;
  int devTb;
  int ? flage;
  dynamic deletedAt;
  DateTime ? createdAt;
  DateTime ? updatedAt;

  factory GebModel.fromJson(Map<String, dynamic> json) => GebModel(
    id: json["id"],
    uid: json["uid"],
    kwh: json["kwh"],
    devKwh: json["dev_kwh"],
    kvarh: json["kvarh"],
    devKvarh: json["dev_kvarh"],
    kvah: json["kvah"],
    devKvah: json["dev_kvah"],
    pf: json["pf"],
    devPf: json["dev_pf"],
    md: json["md"],
    devMd: json["dev_md"],
    mf: json["mf"],
    tb: json["tb"],
    devTb: json["dev_tb"],
    flage: json["flage"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "kwh": kwh,
    "dev_kwh": devKwh,
    "kvarh": kvarh,
    "dev_kvarh": devKvarh,
    "kvah": kvah,
    "dev_kvah": devKvah,
    "pf": pf,
    "dev_pf": devPf,
    "md": md,
    "dev_md": devMd,
    "mf": mf,
    "tb": tb,
    "dev_tb": devTb,
    "flage": flage,
    "deleted_at": deletedAt,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
