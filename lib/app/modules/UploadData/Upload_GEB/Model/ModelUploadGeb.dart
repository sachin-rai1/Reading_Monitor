import 'dart:convert';

List<ModelUploadGeb> modelUploadGebFromJson(String str) => List<ModelUploadGeb>.from(json.decode(str).map((x) => ModelUploadGeb.fromJson(x)));

String modelUploadGebToJson(List<ModelUploadGeb> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUploadGeb {
  ModelUploadGeb({
    this.id,
   required this.date,
   required this.kwh,
   required this.kvarh,
   required this.kevah,
   required this.md,
   required this.turbine,
  });

  int ? id;
  DateTime ? date;
  int kwh;
  int kvarh;
  int kevah;
  int md;
  int turbine;

  factory ModelUploadGeb.fromJson(Map<String, dynamic> json) => ModelUploadGeb(
    id: json["id"],
    date: json["date"],
    kwh: json["kwh"],
    kvarh: json["kvarh"],
    kevah: json["kevah"],
    md: json["md"],
    turbine: json["turbine"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "kwh": kwh,
    "kvarh": kvarh,
    "kevah": kevah,
    "md": md,
    "turbine": turbine,
  };
}
