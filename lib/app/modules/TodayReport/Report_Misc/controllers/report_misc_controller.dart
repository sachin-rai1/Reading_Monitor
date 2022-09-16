import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Misc/Model/ModelMiscReport.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/Constants.dart';
import 'package:http/http.dart' as http;

class ReportMiscController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var isLoading = true.obs;
  var miscList = <ModelViewMisc>[].obs;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      fetchMiscViewReport();
    }
  }

  @override
  void onInit() {
    fetchMiscViewReport();
    super.onInit();
  }

  void fetchMiscViewReport() async {
    try {
      // isLoading(true);
      var machine = await fetchMiscViewReportList();
      miscList.value = machine;
    } finally {
      isLoading(false);
    }
  }
   Future<List<ModelViewMisc>> fetchMiscViewReportList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/ViewReportMiscDateSearch/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      print(data);
      return modelViewMiscFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }

}
