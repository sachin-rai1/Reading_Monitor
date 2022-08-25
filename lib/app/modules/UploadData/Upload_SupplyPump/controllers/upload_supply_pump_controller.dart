import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_SupplyPump/Model/ModelUploadSupplyPump.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/Constants.dart';

class UploadSupplyPumpController extends GetxController {
  var selectedDate = DateTime.now().obs;
  TextEditingController machine = TextEditingController();
  TextEditingController flow = TextEditingController();
  TextEditingController unit = TextEditingController();
  int id = 0;
  var uploadSupplypumpList = <ModelUploadSupplyPump>[].obs;
  var isLoading = true.obs;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      supplydata();
    }
  }

  Future<List<ModelUploadSupplyPump>> fetchUploadSupplypumpList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          // "${Constants.connectionString}/GetSupplyPumpListing"
          "${Constants.connectionString}/GetSupplyPumpReportUploadDateSerch/${selectedDate.toString().split(" ")[0]}"
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );

    if (response.statusCode == 200) {
      var data1 = response.body;
      var data = jsonDecode(response.body);
      print(data);
      if (data.length != 0) {
        machine.text = data[0]['name'];
        flow.text = data[0]['flow'];
        unit.text = data[0]['unit'];
      } else {
        clearData();
      }

      return modelUploadSupplyPumpFromJson(data1);
    } else {
      // throw TimeoutException("TimeOut");
      throw Exception();

    }
  }

  void supplydata() async {
    try {
      isLoading(true);
      var pumps = await fetchUploadSupplypumpList();
      uploadSupplypumpList.value = pumps;
    } finally {
      isLoading(false);
    }
  }

  void fetchUploadSupplyPump() {}

  void clearData() {
    machine.clear();
    flow.clear();
    unit.clear();
  }
}
