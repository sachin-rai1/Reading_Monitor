import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/Model/ModelUtilitySubMachineList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../data/Constants.dart';

class SubUtilityController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController average = TextEditingController();
  TextEditingController deviation = TextEditingController();
  var subUtilityList = <ModelUtilitySubMachineList>[].obs;
  var filterData = [].obs;
  var isLoading = true.obs;
  var data1 = Get.arguments;

  @override
  void onInit() {
    fetchSubUtilityMachinelist();
    super.onInit();
  }
  void onClose(){
    fetchSubUtilityMachinelist();
    super.onClose();
}

  Future<ModelUtilitySubMachineList?> fetchSubUtilityMachinelist() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var tokenvalue = prefs.getString("token");
      var response = await http.get(
        Uri.parse("${Constants.connectionString}/GetUtiltiSubCategoriesList"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(response.statusCode);
        print(data);
        for (int i = 0; i < data.length; i++) {
          if (data1.toString() ==
              data[i]["uitility_categories_id"].toString()) {
            filterData.add(data[i]);
          }
        }
        return null;
      } else {
        print(response.statusCode);
        print(response.body);
        throw Exception();
      }
    } finally {
      isLoading(false);
    }
  }

  addUtilitySubMachine(
      ModelUtilitySubMachineList modelUtilitySubMachineList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
        Uri.parse("${Constants.connectionString}/UtiltiSubCategoriesAdd"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        body: jsonEncode(<String, String>{
          "uitility_categories_id": data1,
          "uilitysubc_name": name.text,
          "average": average.text,
          "deviation": deviation.text,
        }));
    if (response.statusCode == 200) {
      print(data1);
      filterData.clear();
      fetchSubUtilityMachinelist();
      var data = jsonEncode(response.body);
      Fluttertoast.showToast(
          msg: "Machine Added Successfully", backgroundColor: Colors.green);
      print(data);
    } else {
      print(data1);
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.red);
      print(response.body);
    }
  }

  Future<ModelUtilitySubMachineList> updateUtilitySubMachine(
    String machineName,
    int averageU,
    int deviationU,
      int id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse(
          "${Constants.connectionString}/UtiltiSubCategoriesUpdate/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        "uilitysubc_name": machineName.toString(),
        "average": averageU.toString(),
        "deviation": deviationU.toString(),
        // "uitility_categories_id": macId.toString()
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      print(data1);
      print(machineName.toString());
      Constants.showtoast("Data Updated!");
      filterData.clear();
      fetchSubUtilityMachinelist();
      clearData();
      return ModelUtilitySubMachineList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  Future<void> deleteUtilitySubMachine(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    try {
      final response = await http.post(
          Uri.parse(
              "${Constants.connectionString}/UtiltiSubCategoriesDelete/$id"),
          body: jsonEncode(<String, String>{
            '_method': "DELETE",
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenvalue',
          });
      if (response.statusCode == 200) {
        print(id);
        filterData.clear();
        fetchSubUtilityMachinelist();
        Constants.showtoast("Machine Deleted!");
      } else {
        Fluttertoast.showToast(
          msg: 'Error In Deleting Data',
          backgroundColor: Colors.red,
        );
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  void clearData() {
    name.clear();
    average.clear();
    deviation.clear();
  }
}
