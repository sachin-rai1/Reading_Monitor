import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/sub_utility_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/utility_controller.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Utilty/Model/ModelViewSubUtility.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Utilty/Model/ModelViewUtility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/Constants.dart';
import 'package:http/http.dart' as http;


class ReportUtiltyController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var isLoading = true.obs;
  var utilityList = <ModelViewUtility>[].obs;
  var subUtilityList = <ModelViewSubUtility>[].obs;
  final  utilityController = Get.put(UtilityController());
  final  subUtilityController = Get.put(SubUtilityController());

  var utilityData;
  var subUtilityData;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now()
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      fetchUtilityViewReportList();
      // fetchSubUtilityViewReport();
    }
  }
  @override
  void onInit()
  {
    fetchUtilityViewReportList();
    super.onInit();
  }



   Future<List<ModelViewUtility>> fetchUtilityViewReport() async {
     print("Getting Util Data");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/ViewReportUtilityDateSerchMainCategories/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      print(selectedDate);
      utilityData = response.body;
      print(response.statusCode);
      print(jsonDecode(utilityData));

      return modelViewUtilityFromJson(utilityData);
    } else {
      print("Error In Util");
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }
  Future<List<ModelViewSubUtility>> fetchSubUtilityViewReport() async {
    print("Getting Sub Data");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/ViewReportUtilityDateSerch/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      print(selectedDate);
      subUtilityData = response.body;
      print(response.statusCode);
      print(jsonDecode(subUtilityData));
      // return null;
      return modelViewSubUtilityFromJson(subUtilityData);
    } else {
      print("Error in SubUtil");
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }
  void fetchUtilityViewReportList() async {
    try {
      isLoading(true);
      print("Util Data ");
      var utility = await fetchUtilityViewReport();
      utilityList.value = utility;
      print("Sub Util Data ");
      var subUtility = await fetchSubUtilityViewReport();
      subUtilityList.value =  subUtility;

    } finally {
      isLoading(false);
    }
  }
}
