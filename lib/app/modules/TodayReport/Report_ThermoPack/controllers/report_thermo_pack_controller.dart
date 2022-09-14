import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_ThermoPack/Model/ModelViewThermoPack.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../data/Constants.dart';

class ReportThermoPackController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var isLoading = true.obs;
  var machineList = <ModelViewThermoPack>[].obs;
  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now()
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }
  Future<void> fetchThermoPackList() async {
    try {
      isLoading(true);
      var gebMachines = await fetchThermoPack();
      machineList.value = gebMachines;
    } finally {
      isLoading(false);
    }
  }

  Future<List<ModelViewThermoPack>> fetchThermoPack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/ViewReportThermopackDateSearchNew/${selectedDate.toString().split(" ")[0]}"),
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
      return modelViewThermoPackFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception();
    }
  }


}
