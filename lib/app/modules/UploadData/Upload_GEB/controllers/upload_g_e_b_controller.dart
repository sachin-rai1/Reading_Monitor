import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_GEB/Model/ModelUploadGeb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../data/Constants.dart';

class UploadGEBController extends GetxController {
  var selectedDate = DateTime.now().obs;
  TextEditingController kwh = TextEditingController();
  TextEditingController kvarh = TextEditingController();
  TextEditingController kvah = TextEditingController();
  TextEditingController md = TextEditingController();
  TextEditingController turbine = TextEditingController();
  int id = 0;

  @override
  void onInit() {
    fetchUploadgebList();
    super.onInit();
  }

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      fetchUploadgebList();
    }
  }

  addUploadGeb(ModelUploadGeb modelUploadGeb) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
        Uri.parse("${Constants.connectionString}/UploadReportGebAdd"),
        body: jsonEncode(<String, String>{
          "date": selectedDate.value.toString(),
          "kwh": kwh.text,
          "kvarh": kvarh.text,
          "kevah": kvah.text,
          "md": md.text,
          "turbine": turbine.text,
        }));
    if (response.statusCode == 200) {
      Constants.showtoast("Data Added Successfully");
      print(jsonDecode(response.body));
      clearData();
    } else {
      Fluttertoast.showToast(
          msg: "Data Already Exists", backgroundColor: Colors.red);
    }
  }

  Future<ModelUploadGeb?> updateTask(DateTime dateTime, int ukwh, int ukvarh,
      int ukvah, int umd, int uturbine, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/UploadReportGebUpdate/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        "date": dateTime.toString(),
        "kwh": ukwh.toString(),
        "kvarh": ukvarh.toString(),
        "kevah": ukvah.toString(),
        "md": umd.toString(),
        "turbine": uturbine.toString(),
        "id": id.toString()
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated");

      return null;
    } else {
      print(selectedDate.value.toString());
      print(response.body);
      throw Exception('Failed to update Data.');
    }
  }



  void fetchUploadgebList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/UploadReportGebSharch/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      if (data.length != 0) {
        kwh.text = data[0]['kwh'];
        kvarh.text = data[0]['kvarh'];
        kvah.text = data[0]['kevah'];
        md.text = data[0]['md'];
        turbine.text = data[0]['turbine'];
        id = data[0]['id'];


      } else {
        clearData();
      }
    }
  }

  Future<Future<bool?>?> fetchUploadedGEB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse(
          "${Constants.connectionString}/UploadReportGebSharch/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data.length != 0) {
        id = data[0]['id'];
        updateTask(
            selectedDate.value,
            int.parse(kwh.text.toString()),
            int.parse(kvarh.text.toString()),
            int.parse(kvah.text.toString()),
            int.parse(md.text.toString()),
            int.parse(turbine.text.toString()),
            int.parse(id.toString()));
      } else {
        addUploadGeb(ModelUploadGeb(
          date: selectedDate.value,
          kwh: int.parse(kwh.text),
          kvarh: int.parse(kvarh.text),
          kevah: int.parse(kvah.text),
          md: int.parse(md.text),
          turbine: int.parse(turbine.text),
        ));
      }
      fetchUploadgebList();

    }
    return null;
  }

  void clearData() {
    kwh.clear();
    kvarh.clear();
    kvah.clear();
    md.clear();
    turbine.clear();
  }
}
