import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:readingmonitor2/app/data/http_service_provider.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/Model/ModelManoMeterSteamBoiler.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/Model/ModelManoMeterThermoPack.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/Constants.dart';

class ManoMeterController extends GetxController {
  TextEditingController steamBoiler = TextEditingController();
  TextEditingController thermoPack = TextEditingController();

  var isLoading = true.obs;
  var isLoadingThermopack = true.obs;
  var steamBoilermachineList = <ModelManoMeterSteamBoiler>[].obs;
  var thermoPackmachineList = <ModelManoMeterThermoPack>[].obs;

  @override
  void onInit() {
    fetchManometerSteamBoiler();
    fetchManomterThermoPack();
    super.onInit();
  }

  @override
  void onClose() {
    fetchManometerSteamBoiler();
    fetchManomterThermoPack();
    super.onClose();
  }

  //*****-----------------fetch SteamBoiler Started **--------

  Future<void> fetchManometerSteamBoiler() async {
    try {
      isLoading(true);
      var manoMeterSteamBoiler =
          await HttpServiceProvider.fetchManometerSteamBoiler();
      steamBoilermachineList.value = manoMeterSteamBoiler;
    } finally {
      isLoading(false);
    }
  }

  Future<ModelManoMeterSteamBoiler> updateManoMeterSteamBoiler(
      String category, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/UtiliyUpdate/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        '_method': "PUT",
        "uitility_categories": category.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      print(tokenvalue);
      fetchManometerSteamBoiler();
      return ModelManoMeterSteamBoiler.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  addManoMeterSteamBoiler(
      ModelManoMeterSteamBoiler modelManoMeterSteamBoiler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response =
        await http.post(Uri.parse("${Constants.connectionString}/UtilityAdd"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $tokenvalue',
            },
            body: jsonEncode(<String, String>{
              "steamBoiler": steamBoiler.text,
            }));
    if (response.statusCode == 200) {
      fetchManometerSteamBoiler();
      print(steamBoiler.text);
      var data = jsonEncode(response.body);
      Fluttertoast.showToast(
          msg: "Machine Added Successfully", backgroundColor: Colors.green);
      print(data);
    } else {
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.red);
      print(response.body);
    }
  }

  Future<void> deleteManoMeterSteamBoiler(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    try {
      final response = await http
          .post(Uri.parse("${Constants.connectionString}/UtiliyDelete/$id"),
              body: jsonEncode(<String, String>{
                '_method': "DELETE",
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenvalue',
          });
      if (response.statusCode == 200) {
        print(id);
        fetchManometerSteamBoiler();
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

  //-----------------**** ThermoPack Started ----------*****

  Future<void> fetchManomterThermoPack() async {
    try {
      isLoadingThermopack(true);
      var manoMeterThermoPack =
          await HttpServiceProvider.fetchManometerThermopack();
      thermoPackmachineList.value = manoMeterThermoPack;
    } finally {
      isLoadingThermopack(false);
    }
  }

  Future<ModelManoMeterThermoPack> updateManomterThermoPack(
      String category, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/UtiliyUpdate/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        '_method': "PUT",
        "uitility_categories": category.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      print(tokenvalue);
      fetchManomterThermoPack();
      return ModelManoMeterThermoPack.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  addManoMeterThermoPack(
      ModelManoMeterThermoPack modelManoMeterThermoPack) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response =
        await http.post(Uri.parse("${Constants.connectionString}/UtilityAdd"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $tokenvalue',
            },
            body: jsonEncode(<String, String>{
              "uitility_categories": thermoPack.text,
            }));
    if (response.statusCode == 200) {
      fetchManomterThermoPack();
      print(thermoPack.text);
      var data = jsonEncode(response.body);
      Fluttertoast.showToast(
          msg: "Machine Added Successfully", backgroundColor: Colors.green);
      print(data);
    } else {
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.red);
      print(response.body);
    }
  }

  Future<void> deleteManoMeterThermoPack(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    try {
      final response = await http
          .post(Uri.parse("${Constants.connectionString}/UtiliyDelete/$id"),
              body: jsonEncode(<String, String>{
                '_method': "DELETE",
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenvalue',
          });
      if (response.statusCode == 200) {
        print(id);
        fetchManomterThermoPack();
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
}
