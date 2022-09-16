import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_SteamBoiler/Model/ModelReportSteamBoiler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/Constants.dart';
import 'package:http/http.dart' as http;

class ReportSteamBoilerController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var isLoading = true.obs;
  var machineList = <ModelReportSteamBoiler>[].obs;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      fetchSteamBoiler();
    }
  }

  Future<void> fetchSteamBoiler() async {
    try {
      isLoading(true);
      var steamBoilerMachine = await fetchReportSteamBoiler();
      machineList.value = steamBoilerMachine;
    } finally {
      isLoading(false);
    }
  }

  Future<List<ModelReportSteamBoiler>> fetchReportSteamBoiler() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/ViewReportSteamBoilerDateSearchNew/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      return modelReportSteamBoilerFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception();
    }
  }

  @override
  void onInit() {

    fetchSteamBoiler();
    super.onInit();
  }
}
