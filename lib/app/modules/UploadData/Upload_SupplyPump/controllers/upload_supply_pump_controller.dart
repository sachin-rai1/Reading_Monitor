import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/SupplyPump/controllers/supply_pump_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_SupplyPump/Model/ModelUploadSupplyPump.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/Constants.dart';

class UploadSupplyPumpController extends GetxController {
  var selectedDate = DateTime.now().obs;
  final supplyController = Get.put(SupplyPumpController());
  List<TextEditingController> machine = [];
  List<TextEditingController> flow = [];
  List<TextEditingController> unit = [];
  List<TextEditingController> valueID = [];
  int id = 0;
  var uploadSupplypumpList = <ModelUploadSupplyPump>[].obs;
  var isLoading = true.obs;
  var data;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      unit.clear();
      flow.clear();
      supplydata();
    }
  }

  @override
  void onInit() {
    supplyController.fetchSupplyPumps();
    supplydata();
    super.onInit();
  }

  Future<List<ModelUploadSupplyPump>> fetchUploadSupplypumpList() async {
    isLoading(true);
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
      data = jsonDecode(response.body);
      if (data.length != 0) {
        for (int i = 0; i < supplyController.supplyPumpList.length; i++) {
          if (i < data.length) {
            var idController =
                TextEditingController(text: data[i]['id'].toString());
            var machineController =
                TextEditingController(text: data[i]['machine'].toString());
            var flowController =
                TextEditingController(text: data[i]['flow'].toString());
            var unitController =
                TextEditingController(text: data[i]['unit'].toString());
            valueID.add(idController);
            machine.add(machineController);
            unit.add(unitController);
            flow.add(flowController);
            isLoading(false);
            // print(data);
          } else {
            var flowController = TextEditingController(text: "0");
            flow.add(flowController);
            var unitController = TextEditingController(text: "0");
            unit.add(unitController);
            isLoading(false);
          }
        }
      } else {
        for (int i = 0; i < supplyController.supplyPumpList.length; i++) {
          var flowController = TextEditingController(text: "0");
          flow.add(flowController);
          var unitController = TextEditingController(text: "0");
          unit.add(unitController);
          isLoading(false);
        }
      }
      isLoading(false);
      return modelUploadSupplyPumpFromJson(response.body);
    } else {
      throw Exception();
    }
  }

  void supplydata() async {
    try {
      isLoading(true);
      var pumps = await fetchUploadSupplypumpList();
      uploadSupplypumpList.value = pumps;
      for (int i = 0; i < supplyController.supplyPumpList.length; i++) {
        print("This Is Machine ID ${listdata[i].id}");
        print("This is Data Id ${data[i]['id'].toString()}");
      }
    } finally {
      isLoading(false);
    }
  }


  late var listdata = supplyController.supplyPumpList;

  void addSupplyList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    for (int i = 0; i < supplyController.supplyPumpList.length; i++) {
      if (unit[i].text == "" || flow[i].text == "") {
        unit[i].text = "0";
        flow[i].text = "0";
      }
      else if (data[i]['id'] == listdata[i].id)
        {
          print("--------------------Id Found-------------------");
        }
      final response = await http.post(
        Uri.parse('${Constants.connectionString}/GetSupplyPumpReportUploadAdd'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "date": selectedDate.toString().split(" ")[0],
          "supplyp_name_id": listdata[i].id.toString(),
          "flow": flow[i].text.toString(),
          "unit": unit[i].text.toString(),
        }),
      );
      if (response.statusCode == 200) {
        print(tokenvalue);
        print(jsonDecode(response.body));
        print(unit.toString());
        print(flow.toString());
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
    supplydata();
  }
  void updateSupplyList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    for (int i = 0; i < listdata.length; i++) {
      print(data[i]['id']);
      final response = await http.put(
        Uri.parse(
            '${Constants.connectionString}/SupplyPumpReportUploadUpdated/${data[i]['id']}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "flow": flow[i].text,
          "unit": unit[i].text,
        }),
      );
      if (response.statusCode == 200) {
        print(data[i]['id']);
        print(unit.toString());
        print(flow.toString());
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
    supplydata();
  }

  void clearData() {
    machine.clear();
    flow.clear();
    unit.clear();
  }
}
