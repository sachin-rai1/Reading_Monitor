import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Misc/Model/ModelMiscMachineList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/Constants.dart';

class UploadMiscController extends GetxController {
  var selectedDate = DateTime.now().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onStart();
    fetchMiscList();
  }

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      valueUnit.clear();
      fetchMiscList();


    }
  }

  @override
  void onInit() {
    fetchMiscList();
    super.onInit();

  }

  //
  var isLoading = true.obs;

  List<TextEditingController> valueUnit = [];
  List<TextEditingController> valueID = [];

  late SharedPreferences prefs;
  String? tokenvalue;
  var data;
  var listdata;

  Future<List<ModelMachineMisc>?> fetchMiscList() async {
    isLoading(true);
    prefs = await SharedPreferences.getInstance();
    tokenvalue = prefs.getString("token");
    final response = await http.get(
      Uri.parse('${Constants.connectionString}/MiscLisiting'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      print("machine List");
      print(tokenvalue);
      listdata = jsonDecode(response.body);
      print(listdata);

      final responses = await http.get(
        Uri.parse(
            '${Constants.connectionString}/MiscReportUploadSharch/${selectedDate.toString().split(" ")[0]}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
      );
      if (responses.statusCode == 200) {
        data = jsonDecode(responses.body);
        print("upload data");
        print(data);
        if (data.length == 0) {
          for (int i = 0; i < listdata.length; i++) {
            var textEditingController = TextEditingController(text: "");
            valueUnit.add(textEditingController);
            isLoading(false);
          }
        } else {
          for (int i = 0; i < listdata.length; i++) {
            if (i < data.length) {
              // print("with data");
              var idController =
                  TextEditingController(text: data[i]['id'].toString());
              var unitsController =
                  TextEditingController(text: data[i]['unit'].toString());
              valueID.add(idController);
              valueUnit.add(unitsController);
            } else {
              // print("without data");
              var unitsController = TextEditingController(text: "0");
              valueUnit.add(unitsController);
            }
          }
        }
      } else {
        print(responses.statusCode);
        print(responses.body);

        Constants.showtoast("Error Fetching Data.");
      }
    } else {
      Constants.showtoast("Error Fetching Data.");
    }
    isLoading(false);
    return null;
  }

  //todo    when adding the data if the data has no value send "" (null string data or zero)
  //todo but never let anyone go null coz it will effect the machine indexing while it has been replaced

  void addMiscList() async {
    for (int i = 0; i < listdata.length; i++) {
      if (valueUnit[i].text == "") {
        valueUnit[i].text = "0";
      }
      final response = await http.post(
        Uri.parse('${Constants.connectionString}/MiscReportUploadAdd'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "date": selectedDate.toString().split(" ")[0],
          "machine_id": listdata[i]["id"].toString(),
          "machine_name": listdata[i]["machine_name"].toString(),
          "unit": valueUnit[i].text,
        }),
      );
      if (response.statusCode == 200) {
        if (i == listdata.length - 1) {
          print(valueUnit.toString());
          Constants.showtoast("Report Added!");
        }
      } else {
        print(response.statusCode);
        print(response.body);
        Constants.showtoast("Error Updating Data.");
      }
    }
    fetchMiscList();
  }

  void updateMiscList() async {
    for (int i = 0; i < listdata.length; i++) {
      print(data[i]['id']);
      print(valueUnit[i].text);
      final response = await http.put(
        Uri.parse(
            '${Constants.connectionString}/MiscReportUploadUpdate/${data[i]['id']}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "unit": valueUnit[i].text,
        }),
      );
      if (response.statusCode == 200) {
        if (i == listdata.length - 1) {
          Constants.showtoast("Report Updated!");
        }
        // Constants.showtoast("Report Updated!");
      } else {
        print(response.statusCode);
        print(response.body);
        Constants.showtoast("Error Updating Data.");
      }
    }
    fetchMiscList();
  }
}
