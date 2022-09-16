import 'dart:convert';

List<ModelFlueGasThermopack> modelFlueGasThermopackFromJson(String str) => List<ModelFlueGasThermopack>.from(json.decode(str).map((x) => ModelFlueGasThermopack.fromJson(x)));

String modelFlueGasThermopackToJson(List<ModelFlueGasThermopack> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelFlueGasThermopack {
  ModelFlueGasThermopack({
    this.id,
    this.userId,
    this.machineName,
    this.value,
    this.deviation,
    this.temperature,
    this.temperatureDeviation,

  });

  int ? id;
  int ? userId;
  String ?  machineName;
  num ? value;
  num ? deviation;
  num ? temperature;
  num ? temperatureDeviation;



  factory ModelFlueGasThermopack.fromJson(Map<String, dynamic> json) => ModelFlueGasThermopack(
    id: json["id"],
    userId: json["user_id"],
    machineName: json["machine_name"],
    value: json["value"],
    deviation: json["deviation"],
    temperature: json["temperature"],
    temperatureDeviation: json["temperature_deviation"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "machine_name": machineName,
    "value": value,
    "deviation": deviation,
    "temperature": temperature,
    "temperature_deviation": temperatureDeviation,


  };
}
