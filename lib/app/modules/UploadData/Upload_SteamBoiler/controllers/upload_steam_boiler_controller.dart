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

  var selectedDate = DateTime.now().obs;

  chooseDate() async
  {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now()
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  addUploadSteamBoiler(UploadSteamBoilerModel uploadSteamBoilerModel) async
  {
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/ursbadd"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String , String>
      {
        "date": selectedDate.value.toString(),
        "bfw": bfw.text,
        "coal1": coal1.text,
        "coal2": coal2.text,
        "bfw_emperature": bfwEmperature.text,
      }
      )
    );
    if(response.statusCode == 200)
      {
        Fluttertoast.showToast(msg: "Data Added Successfully" ,  backgroundColor: Colors.green);
      }
    else
      {
        Fluttertoast.showToast(msg: "Data Already Exists" , backgroundColor: Colors.red);
        print(response.body);
        print(response.statusCode);
      }
  }
}
