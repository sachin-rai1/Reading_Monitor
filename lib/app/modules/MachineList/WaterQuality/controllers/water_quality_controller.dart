import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/WaterQuality/Model/ModelWaterQuality.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../data/Constants.dart';
import '../../../../data/http_service_provider.dart';

class WaterQualityController extends GetxController {
  TextEditingController machineName = TextEditingController();
  TextEditingController tds = TextEditingController();
  TextEditingController tdsPer = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController phPerc = TextEditingController();
  TextEditingController hardness = TextEditingController();
  TextEditingController hardnessPerc = TextEditingController();
  var isLoading = true.obs;
  var machineList = <ModelWaterQuality>[].obs;

  @override
  void onInit() {
    fetchWaterQualityList();
    super.onInit();
  }

  @override
  void onClose() {
    fetchWaterQualityList();
    super.onClose();
  }

  Future<void> fetchWaterQualityList() async {
    try {
      // isLoading(true);
      var waterQualitymachines =
          await HttpServiceProvider.fetchWaterQualityList();
      machineList.value = waterQualitymachines;
    } finally {
      isLoading(false);
    }
  }

  Future<void> addWaterQuality(ModelWaterQuality modelWaterQuality) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
        Uri.parse("${Constants.connectionString}/WaterQualityAdd"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "machine_name": machineName.text,
          "tds": tds.text,
          "tds_percentage": tdsPer.text,
          "ph": ph.text,
          "ph_deviation": phPerc.text,
          "hardness": hardness.text,
          "hardness_percentage": hardnessPerc.text,
        }));
    if (response.statusCode == 200) {
      machineList.add(modelWaterQuality);
      fetchWaterQualityList();
      clearData();
    var data = jsonEncode(response.body);
      Fluttertoast.showToast(
          msg: "Machine Added Successfully", backgroundColor: Colors.green);
      print(data);
    } else {
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.red);
      print(response.body);
    }
  }

  Future<ModelWaterQuality> updateWaterQuality(
      String machineName,
      int tds,
      int tds_per,
      int ph,
      int phPer,
      int harness,
      int hardnessPer,
      int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/WaterQualityUpdate/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        '_method': "PUT",
        "machine_name": machineName.toString(),
        "tds": tds.toString(),
        "tds_percentage": tds_per.toString(),
        "ph": ph.toString(),
        "ph_deviation": phPer.toString(),
        "hardness": harness.toString(),
        "hardness_percentage": hardnessPer.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      print(tokenvalue);
      fetchWaterQualityList();
      clearData();
      return ModelWaterQuality.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  Future<void> deleteWaterQuality(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    try {
      final response = await http.post(
          Uri.parse("${Constants.connectionString}/WaterQualityDelete/$id"),
          body: jsonEncode(<String, String>{
            '_method': "DELETE",
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenvalue',
          });
      if (response.statusCode == 200) {
        print(id);
        fetchWaterQualityList();
        Constants.showtoast("Machine Deleted!");
      } else {
        Fluttertoast.showToast(
          msg: 'Error In Deleting Data',
          backgroundColor: Colors.red,
        );
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  clearData() {
    machineName.clear();
    tds.clear();
    tdsPer.clear();
    ph.clear();
    phPerc.clear();
    hardness.clear();
    hardnessPerc.clear();
  }
}
