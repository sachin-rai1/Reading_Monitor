import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/data/Constants.dart';
import '../../SupplyPump/providers/http_service_provider.dart';
import '../Model/ModelMachineList.dart';
import 'package:http/http.dart' as http;

class MachineController extends GetxController {
  TextEditingController category = TextEditingController();
  var isLoading = true.obs;
  var machineList = <ModelMachineList>[].obs;

  @override
  void onInit() {
    fetchMachineList();
    super.onInit();
  }

  @override
  void onClose() {
    onInit();
    fetchMachineList();
    super.onClose();
  }

  void fetchMachineList() async {
    try {
      isLoading(true);
      var machines = await HttpServiceProvider.fetchMachinelist();
      machineList.value = machines;
    } finally {
      isLoading(false);
    }
  }

  addMachine(ModelMachineList modelMachineList) async {
    final response =
        await http.put(Uri.parse("${Constants.connectionString}/mcadd"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "categories": category.text,
            }));
    if (response.statusCode == 200) {
      machineList.add(modelMachineList);
      Fluttertoast.showToast(
          msg: "Machine Added Successfully", backgroundColor: Colors.green);
    } else {
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.red);
    }
  }

  Future<ModelMachineList?> updateMachine(String categories, int id) async {
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/mcupdate"),
      body: jsonEncode(<String, String>{
        "id": id.toString(),
        "categories": categories.toString(),
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Machine Updated", backgroundColor: Colors.green);
      fetchMachineList();
    } else {
      Fluttertoast.showToast(
          msg: "Error in Update", backgroundColor: Colors.red);
      print(response.body);
    }
    return null;
  }
}
