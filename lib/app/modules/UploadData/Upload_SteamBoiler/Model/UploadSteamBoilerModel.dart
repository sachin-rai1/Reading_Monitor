import 'dart:convert';

List<UploadSteamBoilerModel> uploadSteamBoilerModelFromJson(String str) => List<UploadSteamBoilerModel>.from(json.decode(str).map((x) => UploadSteamBoilerModel.fromJson(x)));

String uploadSteamBoilerModelToJson(List<UploadSteamBoilerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UploadSteamBoilerModel {
  UploadSteamBoilerModel({
    this.id,
    required this.date,
    required this.bfw,
    required this.coal1,
    required this.coal2,
    required this.bfwEmperature,
    this.createdAt,
    this.updatedAt,
  });

  int ? id;
  DateTime date;
  int bfw;
  int coal1;
  int coal2;
  int bfwEmperature;
  DateTime ? createdAt;
  DateTime ? updatedAt;

  factory UploadSteamBoilerModel.fromJson(Map<String, dynamic> json) => UploadSteamBoilerModel(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    bfw: json["bfw"],
    coal1: json["coal1"],
    coal2: json["coal2"],
    bfwEmperature: json["bfw_emperature"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "bfw": bfw,
    "coal1": coal1,
    "coal2": coal2,
    "bfw_emperature": bfwEmperature,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
