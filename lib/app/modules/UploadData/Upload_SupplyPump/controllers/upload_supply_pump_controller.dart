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
          "${Constants.connectionString}/GetSupplyPumpReportUploadDateSerch/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      if (data.length != 0) {
        // machine.text = data[0]['name'];
        // flow.text = data[0]['flow'];
        // unit.text = data[0]['unit'];
      } else {
        clearData();
      }

      return modelUploadSupplyPumpFromJson(response.body);
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

  final List<TextEditingController> _unitController = [];
  final List<TextField> _unitFields = [];
  final List<TextEditingController> _flowControllers = [];
  final List<TextField> _flowFields = [];

  // Widget _addTile(BuildContext context) {
  //
  //   var stringListReturnedFromApiCall = ["first", "second", "third", "fourth", "..."];
  //   // This list of controllers can be used to set and get the text from/to the TextFields
  //   Map<String,TextEditingController> textEditingControllers = {};
  //   var textFields = <TextField>[];
  //   stringListReturnedFromApiCall.forEach((str) {
  //     var textEditingController = new TextEditingController(text: str);
  //     textEditingControllers.putIfAbsent(str, ()=>textEditingController);
  //     return textFields.add( TextField(controller: textEditingController));
  //   });
  //   // return ListTile(
  //   //     title: Icon(Icons.add),
  //   //     onTap: () {
  //   //       final controller = TextEditingController();
  //   //       final field = TextField(
  //   //         controller: controller,
  //   //         decoration: InputDecoration(
  //   //           border: OutlineInputBorder(),
  //   //           labelText: "name${_unitController.length + 1}",
  //   //         ),
  //   //       );
  //   //
  //   //       _unitController.add(controller);
  //   //       _unitFields.add(field);
  //   //     });
  // }
}
