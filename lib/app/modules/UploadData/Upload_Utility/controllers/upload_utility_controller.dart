import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/utility_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_Utility/Model/ModelUploadUtility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../data/Constants.dart';

class UploadUtilityController extends GetxController {
  var selectedDate = DateTime.now().obs;
  List<TextEditingController> nameText = [];
  List<TextEditingController> emText = [];
  List<TextEditingController> hmText = [];
  List<TextEditingController> valueID = [];
  int id = 0;
  final utilityController = Get.put(UtilityController());
  var isLoading = true.obs;
  var uploadUtilityList = <ModelUploadUtility>[].obs;
  var data;


  late var left_data = (utilityController.utilitymachineList.length - data.length).obs;

 late String selectedValue = utilityController.utilitymachineList[0].uitilityCategories.toString();

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      emText.clear();
      hmText.clear();
      utilityData();
    }
  }

  void onInit()
  {
    emText.clear();
    hmText.clear();
    utilityData();
    super.onInit();
  }

  Future<List<ModelUploadUtility>> fetchUploadUtilityList() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/GetUtiltiReportUploadQuery/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      if (data.length != 0) {
        for (int i = 0; i < listdata.length; i++) {
          if (i < data.length) {
            var idController =
                TextEditingController(text: data[i]['id'].toString());
            var machineController =
                TextEditingController(text: data[i]['uilitysubc_name'].toString());
            var hmController =
                TextEditingController(text: data[i]['hm'].toString());
            var emController =
                TextEditingController(text: data[i]['em'].toString());
            valueID.add(idController);
            nameText.add(machineController);
            emText.add(emController);
            hmText.add(hmController);
            isLoading(false);
            // print(data);
          } else {
            var hmController = TextEditingController(text: "0");
            emText.add(hmController);
            var emController = TextEditingController(text: "0");
            hmText.add(emController);
            isLoading(false);
          }
        }
      } else {
        for (int i = 0; i < listdata.length; i++) {
          var hmController = TextEditingController(text: "0");
          emText.add(hmController);
          var emController = TextEditingController(text: "0");
          hmText.add(emController);
          isLoading(false);
        }
      }
      isLoading(false);
      return modelUploadUtilityFromJson(response.body);
    } else {
      throw Exception();
    }
  }

  void utilityData() async {
    try {
      isLoading(true);
      var pumps = await fetchUploadUtilityList();
      uploadUtilityList.value = pumps;
      for (int i = 0; i < utilityController.utilitymachineList.length; i++) {
        print("This Is Machine ID ${listdata[i].id}");
      }
    } finally {
      isLoading(false);
    }
  }

  late var listdata = utilityController.utilitymachineList;

  void addUtilityList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    for (int i = 0; i < utilityController.utilitymachineList.length; i++) {
      if (emText[i].text == "" || hmText[i].text == "") {
        emText[i].text = "0";
        hmText[i].text = "0";
      } else if (data[i]['id'] == listdata[i].id) {
        print("--------------------Id Found-------------------");
      }
      final response = await http.post(
        Uri.parse(
            '${Constants.connectionString}/GetUtiltiReportUploadQueryAdd'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "date": selectedDate.toString().split(" ")[0],
          "supplyp_name_id": listdata[i].id.toString(),
          "hm": emText[i].text.toString(),
          "em": hmText[i].text.toString(),
        }),
      );
      if (response.statusCode == 200) {
        print(tokenvalue);
        print(jsonDecode(response.body));
        print(emText.toString());
        print(hmText.toString());
        print("This Is Machine ID ${listdata[i].id}");
        print(data[i]['id']);

        if (i == listdata.length - 1) {
          Constants.showtoast("Report Added!");
        }
      } else {
        print(response.statusCode);
        print(response.body);
        Constants.showtoastError("Error Updating Data.");
      }
    }
    utilityData();
  }

  void updateUtiliyList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    for (int i = 0; i < listdata.length; i++) {
      print(data[i]['id']);
      final response = await http.put(
        Uri.parse(
            '${Constants.connectionString}/GetUtiltiReportUploadQueryUpdated/${data[i]['id']}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "hm": emText[i].text,
          "em": hmText[i].text,
        }),
      );
      if (response.statusCode == 200) {
        print(data[i]['id']);
        print(emText.toString());
        print(hmText.toString());
        print(jsonDecode(response.body));

        if (i == listdata.length - 1) {
          Constants.showtoast("Report Updated!");
        }
      } else {
        print(response.statusCode);
        print(response.body);
        Constants.showtoast("Error Updating Data.");
      }
    }
    utilityData();
  }

  void clearData() {
    nameText.clear();
    emText.clear();
    hmText.clear();
  }
}
