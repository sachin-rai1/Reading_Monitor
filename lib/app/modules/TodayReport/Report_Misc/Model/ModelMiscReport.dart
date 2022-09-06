import 'dart:convert';

  List<ModelViewMisc> modelViewMiscFromJson(String str) => List<ModelViewMisc>.from(json.decode(str).map((x) => ModelViewMisc.fromJson(x)));
String modelViewMiscToJson(List<ModelViewMisc> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelViewMisc {
  ModelViewMisc({
    this.id,
    this.date,
    this.unit,
    this.deviation,
    this.machineName,
  });

  int ? id;
  DateTime ? date;
  int ? unit;
  String ? deviation;
  String ? machineName;

  factory ModelViewMisc.fromJson(Map<String, dynamic> json) => ModelViewMisc(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    unit: json["unit"],
    deviation: json["deviation"],
    machineName: json["machine_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "unit": unit,
    "deviation": deviation,
    "machine_name": machineName,
  };
}
