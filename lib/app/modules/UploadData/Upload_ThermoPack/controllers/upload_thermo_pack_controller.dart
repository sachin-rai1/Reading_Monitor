import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;
import 'package:readingmonitor2/app/data/Constants.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_ThermoPack/Model/Upload_thermo_pack_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var data;
  var isLoading = true.obs;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      fetchUploadedThermoPack();
    }
  }

  addUploadThermoPack(ModelUploadThermoPack uploadThermoPackModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        Uri.parse("${Constants.connectionString}/GetThermopackReportUploadAdd"),
        body: jsonEncode(<String, String>{
          "date": selectedDate.value.toString(),
          "chamber": chambers.text,
          "coal_1": coal1.text,
          "coal_2": coal2.text,
          "in_temperature": inTemperature.text,
          "out_temperature": outTemperature.text,
          "pump_presure": pumpPressure.text,
          "circuit_presure": circuitPressure.text,
        }));
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data Added Successfully", backgroundColor: Colors.green);
      print(jsonDecode(response.body));
      clearData();
      fetchUploadedThermoPack();
    } else {
      Fluttertoast.showToast(
          msg: "Data Already Exists", backgroundColor: Colors.red);
    }
  }

  Future<Future<bool?>?> fetchUploadedThermoPack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/GetThermopackReportUploadDate/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print(selectedDate.value.toIso8601String());
      print(data);
      if (data.length != 0) {
        id = data[0]['id'];
        chambers.text = data[0]['chamber'];
        coal1.text = data[0]['coal_1'];
        coal2.text = data[0]['coal_2'];
        inTemperature.text = data[0]['in_temperature'];
        outTemperature.text = data[0]['out_temperature'];
        pumpPressure.text = data[0]['pump_presure'];
        circuitPressure.text = data[0]['circuit_presure'];
      }
      else{
        clearData();
      }
      return null;
    } else {
      throw Exception();
    }
  }

  @override
  void onInit() {
    fetchUploadedThermoPack();
    super.onInit();
  }

  Future<ModelUploadThermoPack?> updateTask(
      DateTime dateTime,
      int chambers,
      int coal1,
      int coal2,
      int in_temperature,
      int out_temperature,
      int pump_pressure,
      int circuit_pressure,
      int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse(
          "${Constants.connectionString}/GetThermopackReportUploadUpdated/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        "date": dateTime.toString(),
        "chamber": chambers.toString(),
        "coal_1": coal1.toString(),
        "coal_2": coal2.toString(),
        "in_temperature": in_temperature.toString(),
        "out_temperature": out_temperature.toString(),
        "pump_presure": pump_pressure.toString(),
        "circuit_presure": circuit_pressure.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data Updated", backgroundColor: Colors.green);
      clearData();
      fetchUploadedThermoPack();
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
