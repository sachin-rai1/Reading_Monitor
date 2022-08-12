import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/data/ConnectionString.dart';
import 'package:readingmonitor2/app/modules/MachineList/Machine/views/machine_view.dart';
import '../../SupplyPump/providers/http_service_provider.dart';
import '../../Utility/Model/MachineList_Utility_Model.dart';
import 'package:http/http.dart' as http;

class MachineController extends GetxController {
  TextEditingController category = TextEditingController();
  var isLoading = true.obs;
  var machineList = <ModelMachineList>[].obs;

  @override
  void onInit() {
    fetchSupplyPumps();
    super.onInit();
  }

  void fetchSupplyPumps() async {
    try {
      isLoading(true);
      var machines = await HttpServiceProvider.fetchUtilityMachine();
      machineList.value = machines;
    } finally {
      isLoading(false);
    }
  }

  addMachine(ModelMachineList modelMachineList) async {
    final response =
        await http.put(Uri.parse("${Constants.connectionString}/mcadd"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "categories": category.text,
            }));
    if (response.statusCode == 200) {
      machineList.add(modelMachineList);
      Fluttertoast.showToast(
          msg: "Machine Added Successfully", backgroundColor: Colors.green);
    } else {
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.green);
    }
  }
  Future<ModelMachineList> updateMachine(String categories , int id) async
  {

  }

}
