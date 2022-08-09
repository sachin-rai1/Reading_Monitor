import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../data/ConnectionString.dart';
import '../Model/SupplyPumpModel.dart';
import '../providers/http_service_provider.dart';
import '../views/supply_pump_view.dart';
import 'package:http/http.dart' as http;

class SupplyPumpController extends GetxController {
  TextEditingController machineNameTextController = TextEditingController();
  TextEditingController averageTextController = TextEditingController();
  TextEditingController deviationTextController = TextEditingController();
  var isLoading = true.obs;
  var isDataProcessing = false.obs;
  var supplyPumpList = <SupplyPump>[].obs;
  int id = 0;

  @override
  void onInit() {
    fetchSupplyPumps();
    super.onInit();
  }

  void fetchSupplyPumps() async {
    try {
      isLoading(true);
      var pumps = await HttpServiceProvider.fetchSupplyPump();
      supplyPumpList.value = pumps;
    } finally {
      isLoading(false);
    }
  }

  addSupplyPump(SupplyPump m) async {
    HttpServiceProvider add =
        HttpServiceProvider(url: "${Constants.connectionString}/spiadd", body: {
      'machine': machineNameTextController.text,
      'average': averageTextController.text,
      'deviation': deviationTextController.text
    });
    add.post().then((value) {
      if (value.statusCode == 200) {
        supplyPumpList.add(m);
        fetchSupplyPumps();
        print(value.body);
        Constants.showtoast("Machine Added!");
      } else {
        Get.to(() => SupplyPumpView());
        Fluttertoast.showToast(
          msg: 'Error In Adding Data',
          backgroundColor: Colors.red,
        );
      }
    }).catchError((onError) {});
  }

  Future<SupplyPump> updateTask(
      String machine, int average, int deviation, int id) async {
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/spiupdate"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": id.toString(),
        "machine": machine,
        "average": average.toString(),
        "deviation": deviation.toString(),
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      return SupplyPump.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  Future<void> deleteSupplyPump(int id) async {
    try {
      HttpServiceProvider delete = HttpServiceProvider(
          url: "${Constants.connectionString}/spidelete/$id",
          body: jsonEncode(<String, String>{}));
      delete.post().then((value) {
        if (value.statusCode == 200) {
          fetchSupplyPumps();
          Constants.showtoast("Machine Deleted!");
        } else {
          Fluttertoast.showToast(
            msg: 'Error In Deleting Data',
            backgroundColor: Colors.red,
          );
        }
      });
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  void clearData() {
    machineNameTextController.clear();
    averageTextController.clear();
    deviationTextController.clear();
  }
}
