import 'dart:convert';

List<ModelUploadMisc> modelUploadMiscFromJson(String str) => List<ModelUploadMisc>.from(json.decode(str).map((x) => ModelUploadMisc.fromJson(x)));

String modelUploadMiscToJson(List<ModelUploadMisc> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUploadMisc {
  ModelUploadMisc({
    this.id,
    this.machinId,
    this.machineName,
    this.date,
    required this.unit,
  });

  int ? id;
  int ? machinId;
  String ? machineName;
  DateTime ? date;
  String unit;

  factory ModelUploadMisc.fromJson(Map<String, dynamic> json) => ModelUploadMisc(
    id: json["id"],
    machinId: json["machin_id"],
    machineName: json["machine_name"],
    date: DateTime.parse(json["date"]),
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "machin_id": machinId,
    "machine_name": machineName,
    "date": date,
    "unit": unit,
  };
}
