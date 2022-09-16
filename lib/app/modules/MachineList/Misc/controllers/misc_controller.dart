import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Misc/Model/ModelMiscMachineList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../data/Constants.dart';
import '../../../../data/http_service_provider.dart';

class MiscController extends GetxController {
  final count = 0.obs;
  var miscList = <ModelMachineMisc>[].obs;
  var isLoading = true.obs;
  TextEditingController machineNameTextController = TextEditingController();
  TextEditingController average = TextEditingController();
  TextEditingController deviation = TextEditingController();

  @override
  void onInit() {
    fetchMiscList();
    super.onInit();
  }

  @override
  void onClose() {
    fetchMiscList();
    super.onClose();
  }

  void clearData() {
    machineNameTextController.clear();
    average.clear();
    deviation.clear();
  }

  Future deleteMiscList(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    try {
      final response = await http.post(
          Uri.parse(
              "${Constants.connectionString}/MiscDelete/$id"),
          body: jsonEncode(<String, String>{
            '_method': "DELETE",
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenvalue',
          });
      if (response.statusCode == 200) {
        // fetchSupplyPumps();
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

  Future<ModelMachineMisc> updateTask(String machine, int parse, int parse2, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/MiscUpdate/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        '_method': "PUT",
        "machine_name": machine.toString(),
        "unit": parse.toString(),
        "deviation": parse2.toString(),
        "id": id.toString(),
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      Get.back();
      fetchMiscList();
      return ModelMachineMisc.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  addMiscList(ModelMachineMisc modelMiscList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
        Uri.parse("${Constants.connectionString}/MiscAdd"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "machine_name": machineNameTextController.text,
          "average": average.text,
          "deviation": deviation.text
        }));

    if (response.statusCode == 200) {
      miscList.add(modelMiscList);
      fetchMiscList();
      print(response.body);
      Get.back();
      Constants.showtoast("Machine Added!");
    } else {
      Get.to(() => fetchMiscList());
      Fluttertoast.showToast(
        msg: 'Error In Adding Data',
        backgroundColor: Colors.red,
      );
    }
  }

  void fetchMiscList() async {
    try {
      // isLoading(true);
      var pumps = await HttpServiceProvider.fetchMiscList();
      miscList.value = pumps;
    } finally {
      isLoading(false);
    }
  }
}
