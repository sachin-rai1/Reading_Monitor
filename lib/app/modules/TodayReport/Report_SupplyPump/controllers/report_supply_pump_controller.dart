import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_SupplyPump/Model/ModelReportSupplyPump.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../data/Constants.dart';

class ReportSupplyPumpController extends GetxController {
  var machineList = <ModelReportSupplypump>[].obs;
  var selectedDate = DateTime.now().obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSupplyPumpList();
  }

  @override
  void onClose() {}

  Future<void> fetchSupplyPumpList() async {
    try {
      isLoading(true);
      var supplypumpMachines = await fetchReportSupplyPumpList();
      machineList.value = supplypumpMachines;
    } finally {
      isLoading(false);
    }
  }

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      fetchSupplyPumpList();
      print(selectedDate);
    }
  }

  Future<List<ModelReportSupplypump>> fetchReportSupplyPumpList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/ViewReportSupplyPumpDateSearch/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;

      print(response.statusCode);
      print(data);
      print(selectedDate);
      return modelReportSupplypumpFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception();
    }
  }
}


