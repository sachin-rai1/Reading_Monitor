import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/Model/ModelFlueGasSteamBoiler.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/Model/ModelFlueGasThermoPack.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../data/Constants.dart';
import '../../../../data/http_service_provider.dart';

class FlueGasControllerController extends GetxController {
  TextEditingController steamBoiler = TextEditingController();
  TextEditingController steamBoilerValue = TextEditingController();
  TextEditingController steamBoilerTemp = TextEditingController();
  TextEditingController steamBoilerValuePer = TextEditingController();
  TextEditingController steamBoilerTempPer = TextEditingController();

  TextEditingController thermoPack = TextEditingController();
  TextEditingController thermoPackValue = TextEditingController();
  TextEditingController thermoPackTemp = TextEditingController();
  TextEditingController thermoPackValuePer = TextEditingController();
  TextEditingController thermoPackTempPer = TextEditingController();

  var isLoading = true.obs;
  var isLoadingThermopack = true.obs;
  var steamBoilermachineList = <ModelFlueGasSteamBoiler>[].obs;
  var thermoPackmachineList = <ModelFlueGasThermopack>[].obs;

  @override
  void onInit() {
    print("Hii this is !!  FlueGasController  Initialized");
    fetchFlueGasSteamBoiler();
    fetchFlueGasThermoPack();
    super.onInit();
  }

  @override
  void onClose() {
    fetchFlueGasSteamBoiler();
    fetchFlueGasThermoPack();
    super.onClose();
  }

  Future<void> fetchFlueGasThermoPack() async {
    try {
      var flueGasThermoPack =
          await HttpServiceProvider.fetchFlueGasThermopack();
      thermoPackmachineList.value = flueGasThermoPack;
    } finally {
      isLoadingThermopack(false);
    }
  }

  Future<ModelFlueGasThermopack> updateFlueGasThermopack(
      String category,
      int value,
      int valueDev,
      int tempe,
      int tempDev,
      int id
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse(
          "${Constants.connectionString}/GetFlueGasThermoPackListingDataUpdated/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        "machine_name": category,
        "value": value.toString(),
        "deviation": valueDev.toString(),
        "temperature": tempe.toString(),
        "temperature_deviation": tempDev.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      print(tokenvalue);
      fetchFlueGasThermoPack();
      return ModelFlueGasThermopack.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  addFlueGasThermopack(ModelFlueGasThermopack modelFlueGasThermopack) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
        Uri.parse(
            "${Constants.connectionString}/GetFlueGasThermoPackListingDataAdd"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "machine_name": thermoPack.text,
          "value": thermoPackValue.text.toString(),
          "deviation": thermoPackValuePer.text.toString(),
          "temperature": thermoPackTemp.text.toString(),
          "temperature_deviation": thermoPackTempPer.text.toString(),
        }));
    if (response.statusCode == 200) {
      fetchFlueGasThermoPack();
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

  Future<void> deleteFlueGasThermoPack(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    try {
      final response = await http.post(
          Uri.parse(
              "${Constants.connectionString}/GetFlueGasThermoPackListingDelete/$id"),
          body: jsonEncode(<String, String>{
            '_method': "DELETE",
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenvalue',
          });
      if (response.statusCode == 200) {
        fetchFlueGasThermoPack();
        print(id);
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
  void clearThermopack()
  {
    thermoPack.clear();
    thermoPackValue.clear();
    thermoPackValuePer.clear();
    thermoPackTemp.clear();
    thermoPackTempPer.clear();
  }

  //*******-----------------Flue Gas Steam Boiler Started ---------------------------******//

  void clearSteamBoiler()
  {
    steamBoiler.clear();
    steamBoilerValue.clear();
    steamBoilerValuePer.clear();
    steamBoilerTemp.clear();
    steamBoilerTempPer.clear();
  }
  Future<void> fetchFlueGasSteamBoiler() async {
    try {
      // isLoading(true);
      var flueGasSteamBoiler =
          await HttpServiceProvider.fetchFlueGasSteamBoiler();
      steamBoilermachineList.value = flueGasSteamBoiler;
    } finally {
      isLoading(false);
    }
  }

  Future<ModelFlueGasSteamBoiler> updateFlueGasSteamBoiler(
      String category,
      int value,
      int valueDev,
      int tempe,
      int tempDev,
      int id
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse(
          "${Constants.connectionString}/GetFlueGasSteamBolierListingDataUpdated/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        "machine_name": category,
        "value": value.toString(),
        "deviation": valueDev.toString(),
        "temperature": tempe.toString(),
        "temperature_deviation": tempDev.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      print(tokenvalue);
      print(response.body);
      fetchFlueGasSteamBoiler();
      return ModelFlueGasSteamBoiler.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      print(response.statusCode);
      throw Exception('Failed to update Data.');
    }
  }

  addFlueGasSteamBoiler(ModelFlueGasSteamBoiler modelFlueGasSteamBoiler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
        Uri.parse(
            "${Constants.connectionString}/GetFlueGasSteamBolierListingDataAdd"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "machine_name": steamBoiler.text,
          "value": steamBoilerValue.text.toString(),
          "deviation": steamBoilerValuePer.text.toString(),
          "temperature": steamBoilerTemp.text.toString(),
          "temperature_deviation": steamBoilerTempPer.text.toString(),
        }));
    if (response.statusCode == 200) {
      print(response.body);
      fetchFlueGasSteamBoiler();
      var data = jsonEncode(response.body);
      Fluttertoast.showToast(
          msg: "Machine Added Successfully", backgroundColor: Colors.green);
      print(data);
    } else {
      print(response.statusCode);
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.red);
      print(response.body);
      print(jsonDecode(response.body));
    }
  }

  Future<void> deleteFlueGasSteamBoiler(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    try {
      final response = await http.post(
          Uri.parse(
              "${Constants.connectionString}/GetFlueGasSteamBolierListingDataDelete/$id"),
          body: jsonEncode(<String, String>{
            '_method': "DELETE",
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenvalue',
          });
      if (response.statusCode == 200) {
        print(id);
        fetchFlueGasSteamBoiler();
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
