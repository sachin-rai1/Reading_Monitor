import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/Constants.dart';
import '../Model/SupplyPumpModel.dart';
import '../providers/http_service_provider.dart';
import '../views/supply_pump_view.dart';
import 'package:http/http.dart' as http;

class SupplyPumpController extends GetxController {
  TextEditingController machineNameTextController = TextEditingController();
  TextEditingController averageTextController = TextEditingController();
  TextEditingController deviationTextController = TextEditingController();
  var isLoading = true.obs;
  var isDataProcessing = false.obs;
  var supplyPumpList = <ModelSupplyPump>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSupplyPumps();

  }
  @override
  void onClose() {
    fetchSupplyPumps();
    super.onClose();
  }



  void fetchSupplyPumps() async {
    try {
      var pumps = await HttpServiceProvider.fetchSupplyPump();
      supplyPumpList.value = pumps;
    } finally {
      isLoading(false);
    }
  }

  addSupplyPump(ModelSupplyPump m) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
        Uri.parse("${Constants.connectionString}/GetSupplyPumpDataAdd"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "name": machineNameTextController.text,
          "average": averageTextController.text,
          "deviation": deviationTextController.text
        }));

    if (response.statusCode == 200) {
       supplyPumpList.add(m);
      fetchSupplyPumps();
      print(response.body);
      Get.back();
      Constants.showtoast("Machine Added!");
    } else {
      Get.to(() => SupplyPumpView());
      Fluttertoast.showToast(
        msg: 'Error In Adding Data',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<ModelSupplyPump> updateTask(
      String machine, int average, int deviation, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/GetSupplyPumpDataUpdated/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        '_method': "PUT",
        "name": machine.toString(),
        "average": average.toString(),
        "deviation": deviation.toString(),
        "id": id.toString(),
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      Get.back();
      fetchSupplyPumps();
      return ModelSupplyPump.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  Future<void> deleteSupplyPump(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    try {
      final response = await http.post(
          Uri.parse(
              "${Constants.connectionString}/GetSupplyPumpDataDeleted/$id"),
          body: jsonEncode(<String, String>{
            '_method': "DELETE",
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenvalue',
          });
      if (response.statusCode == 200) {
        fetchSupplyPumps();
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

  void clearData() {
    machineNameTextController.clear();
    averageTextController.clear();
    deviationTextController.clear();
  }
}
