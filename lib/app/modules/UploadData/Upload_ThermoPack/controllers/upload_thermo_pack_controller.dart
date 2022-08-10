import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;
import 'package:readingmonitor2/app/data/ConnectionString.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_ThermoPack/Model/Upload_thermo_pack_model.dart';

class UploadThermoPackController extends GetxController {
  var selectedDate = DateTime.now().obs;
  TextEditingController chambers = TextEditingController();
  TextEditingController coal1 = TextEditingController();
  TextEditingController coal2 = TextEditingController();
  TextEditingController inTemperature = TextEditingController();
  TextEditingController pumpPressure = TextEditingController();
  TextEditingController circuitPressure = TextEditingController();
  TextEditingController outTemperature = TextEditingController();
  int id = 0;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  addUploadThermoPack(UploadThermoPackModel uploadThermoPackModel) async {
    final response = await http.put(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        Uri.parse("${Constants.connectionString}/urtpadd"),
        body: jsonEncode(<String, String>{
          "date": selectedDate.value.toString(),
          "chambers": chambers.text,
          "coal1": coal1.text,
          "coal2": coal2.text,
          "in_temperature": inTemperature.text,
          "out_temperature": outTemperature.text,
          "pump_pressure": pumpPressure.text,
          "circuit_pressure": circuitPressure.text,
        }));
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data Added SuccessFully", backgroundColor: Colors.green);
      clearData();
    } else {
      Fluttertoast.showToast(
          msg: "Data Already Exists", backgroundColor: Colors.red);
    }
  }

  Future<Future<bool?>?> fetchUploadedThermoPack() async {
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/urtplist/${selectedDate.value.toString()}"),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      // ignore: unnecessary_null_comparison
      if (data.length != 0) {
        id = data[0]['id'];
        updateTask(
            selectedDate.value,
            int.parse(chambers.text.toString()),
            int.parse(coal1.text.toString()),
            int.parse(coal2.text.toString()),
            int.parse(inTemperature.text.toString()),
            int.parse(outTemperature.text.toString()),
            int.parse(pumpPressure.text.toString()),
            int.parse(circuitPressure.text.toString()),
            int.parse(id.toString()));

      } else {
        addUploadThermoPack(UploadThermoPackModel(
            date: selectedDate.value,
            chambers: int.parse(chambers.text),
            coal1: int.parse(coal1.text),
            coal2: int.parse(coal2.text),
            inTemperature: int.parse(inTemperature.text),
            outTemperature: int.parse(outTemperature.text),
            pumpPressure: int.parse(pumpPressure.text),
            circuitPressure: int.parse(circuitPressure.text)));

      }
      return null;
    } else {
      throw Exception();
    }
  }

  Future<UploadThermoPackModel?> updateTask(
      DateTime dateTime,
      int chambers,
      int coal1,
      int coal2,
      int in_temperature,
      int out_temperature,
      int pump_pressure,
      int circuit_pressure,
      int id) async {
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/urtpupdate"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "date": dateTime.toString(),
        "chambers": chambers.toString(),
        "coal1": coal1.toString(),
        "coal2": coal2.toString(),
        "in_temperature": in_temperature.toString(),
        "out_temperature": out_temperature.toString(),
        "pump_pressure": pump_pressure.toString(),
        "circuit_pressure": circuit_pressure.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data Updated", backgroundColor: Colors.green);
      clearData();
      return null;
    } else {
      print(selectedDate.value.toString());
      print(response.body);
      throw Exception('Failed to update Data.');
    }
  }

  clearData() {
    chambers.clear();
    coal1.clear();
    coal2.clear();
    inTemperature.clear();
    outTemperature.clear();
    pumpPressure.clear();
    circuitPressure.clear();
  }
}
