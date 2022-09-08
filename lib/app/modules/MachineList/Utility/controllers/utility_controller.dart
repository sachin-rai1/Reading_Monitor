import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/Model/ModelUtilityMachineList.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/Constants.dart';
import '../../../../data/http_service_provider.dart';



class UtilityController extends GetxController {
  TextEditingController categories = TextEditingController();

  var isLoading = true.obs;
  var utilitymachineList = <ModelUtilityMachineList>[].obs;
  late Timer timer;

  static var getId;




  @override
  void onInit() async {
    fetchUtilityMachinelist();
    super.onInit();
  }

  @override
  void onClose() {
    fetchUtilityMachinelist();
    super.onClose();
  }
  //
  // @override
  // void onReady() async {
  //   fetchUtilityMachinelist();
  //   super.onReady();
  // }
  //
  // void onDispose()
  // {
  //   fetchUtilityMachinelist();
  //   super.onDelete();
  // }

  void fetchUtilityMachinelist() async {
    try {
      isLoading(true);
      var machinesUtility = await HttpServiceProvider.fetchUtilityMachinelist();
      utilitymachineList.value = machinesUtility;
    } finally {
      isLoading(false);
    }
  }

  Future<ModelUtilityMachineList> updateUtilityMachine(
      String category, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/UtiliyUpdate/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        '_method': "PUT",
        "uitility_categories": category.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      print(tokenvalue);
      fetchUtilityMachinelist();
      return ModelUtilityMachineList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  addUtilityMachine(ModelUtilityMachineList modelUtilityMachineList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response =
        await http.post(Uri.parse("${Constants.connectionString}/UtilityAdd"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $tokenvalue',
            },
            body: jsonEncode(<String, String>{
              "uitility_categories": categories.text,
            }));
    if (response.statusCode == 200) {
      utilitymachineList.add(modelUtilityMachineList);
      fetchUtilityMachinelist();
      print(categories.text);
      var data = jsonEncode(response.body);
      Fluttertoast.showToast(
          msg: "Machine Added Successfully", backgroundColor: Colors.green);
      print(data);
    } else {
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.red);
      print(response.body);
    }
  }

  Future<void> deleteUtilityMachine(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    try {
      final response = await http
          .post(Uri.parse("${Constants.connectionString}/UtiliyDelete/$id"),
              body: jsonEncode(<String, String>{
                '_method': "DELETE",
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenvalue',
          });
      if (response.statusCode == 200) {
        print(id);
        fetchUtilityMachinelist();
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
}
