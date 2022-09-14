import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Machines/Model/ModelReportMachine.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Machines/Model/ModelReportSubMachine.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../data/Constants.dart';

class ReportMachinesController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var isLoading = true.obs;
  var machineList =  <ModelReportMachine>[].obs;
  var subMachineList = <ModelReportSubMachine>[].obs;
  var machineData;
  var subMachineData;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now()
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      fetchMachineViewReportList();
      fetchSubMachineViewReport();

    }
  }
  Future<List<ModelReportMachine>> fetchMachineViewReport() async {
    print("Getting Util Data");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/ViewReportMachineDateSearchMainCategories/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      print(selectedDate);
      machineData = response.body;
      print(response.statusCode);
      print(jsonDecode(machineData));

      return modelReportMachineFromJson(machineData);
    } else {
      print("Error In Util");
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }
  Future<List<ModelReportSubMachine>> fetchSubMachineViewReport() async {
    print("Getting Sub Data");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/ViewReportMachineDateSearch/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      print(selectedDate);
      subMachineData = response.body;
      print(response.statusCode);
      print(jsonDecode(subMachineData));
      // return null;
      return modelReportSubMachineFromJson(subMachineData);
    } else {
      print("Error in SubUtil");
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }
  void fetchMachineViewReportList() async {
    try {
      isLoading(true);
      print("Util Data ");
      var machine = await fetchMachineViewReport();
      machineList.value = machine;

      print("Sub Util Data ");
      var subMachine = await fetchSubMachineViewReport();
      subMachineList.value =  subMachine;

    } finally {
      isLoading(false);
    }
  }



}
