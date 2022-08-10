import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:readingmonitor2/app/modules/UploadData/Upload_SteamBoiler/Model/UploadSteamBoilerModel.dart';
import '../../../../data/ConnectionString.dart';

class UploadSteamBoilerController extends GetxController {
  TextEditingController bfw = TextEditingController();
  TextEditingController coal1 = TextEditingController();
  TextEditingController coal2 = TextEditingController();
  TextEditingController bfwEmperature = TextEditingController();
  int id = 0;

  var selectedDate = DateTime.now().obs;

  chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  addUploadSteamBoiler(UploadSteamBoilerModel uploadSteamBoilerModel) async {
    final response =
        await http.put(Uri.parse("${Constants.connectionString}/ursbadd"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "date": selectedDate.value.toString(),
              "bfw": bfw.text,
              "coal1": coal1.text,
              "coal2": coal2.text,
              "bfw_emperature": bfwEmperature.text,
            }));
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data Added Successfully", backgroundColor: Colors.green);
      clearData();
    } else {
      Fluttertoast.showToast(
          msg: "Data Already Exists", backgroundColor: Colors.red);
      print(response.body);
      print(response.statusCode);
    }
  }

  Future<UploadSteamBoilerModel?> updateTask(DateTime dateTime, int _bfw,
      int coal_1, int coal_2, int bfw_temp, int id) async {
    final response = await http.put(
      Uri.parse('${Constants.connectionString}/ursbpdate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "date": dateTime.toString(),
        "bfw": _bfw.toString(),
        "coal1": coal_1.toString(),
        "coal2": coal_2.toString(),
        "bfw_emperature": bfw_temp.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data Updated", backgroundColor: Colors.green);
      clearData();
    } else {
      print(selectedDate.value.toString());
      print(response.body);
      throw Exception('Failed to update Data.');
    }
  }

  Future<Future<bool?>?> fetchUploadedSteamBoiler() async {
    var response = await http.get(
      Uri.parse(
          '${Constants.connectionString}/ursbsearch/${selectedDate.toString().split(" ")[0]}'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(selectedDate.toString().split(" ")[0]);
      print(data);
      if (data.length != 0) {
        id = data[0]['id'];
        updateTask(
            selectedDate.value,
            int.parse(bfw.text.toString()),
            int.parse(coal1.text.toString()),
            int.parse(coal2.text.toString()),
            int.parse(bfwEmperature.text.toString()),
            int.parse(id.toString()));
      } else {
        addUploadSteamBoiler(UploadSteamBoilerModel(
            date: selectedDate.value,
            bfw: int.parse(bfw.text),
            coal1: int.parse(coal1.text),
            coal2: int.parse(coal2.text),
            bfwEmperature: int.parse(bfwEmperature.text)));
      }
    }
    return null;
  }

  clearData() {
    bfw.clear();
    coal1.clear();
    coal2.clear();
    bfwEmperature.clear();
  }
}
