import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_WaterQuality/Model/ModelReportWaterQuality.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../data/Constants.dart';

class ReportWaterQualityController extends GetxController {
  var machineList = <ModelReportWaterQuality>[].obs;
  var selectedDate = DateTime.now().obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWaterQualityList();
  }

  @override
  void onClose() {}

  Future<void> fetchWaterQualityList() async {
    try {
      isLoading(true);
      var waterQualitymachines = await fetchReportWaterQualityList();
      machineList.value = waterQualitymachines;
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
      fetchWaterQualityList();
      print(selectedDate);
    }
  }

  Future<List<ModelReportWaterQuality>> fetchReportWaterQualityList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/ViewReportWaterQualityDateSearch/${selectedDate.toString().split(" ")[0]}"),
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
      return modelReportWaterQualityFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception();
    }
  }
}
