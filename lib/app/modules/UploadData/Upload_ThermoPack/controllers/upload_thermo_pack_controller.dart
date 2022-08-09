import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:readingmonitor2/app/data/ConnectionString.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_ThermoPack/Model/Upload_thermo_pack_model.dart';

class UploadThermoPackController extends GetxController {
  var selectedDate = DateTime.now().obs;
  TextEditingController chambers = TextEditingController();
  TextEditingController coal1 = TextEditingController();
  TextEditingController coal2 = TextEditingController();
  TextEditingController inTemperature = TextEditingController();
  TextEditingController pumpPressure = TextEditingController();
  TextEditingController circuitPressure = TextEditingController();
  TextEditingController outTemperature = TextEditingController();

  Future<void> chooseDate() async {
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
  addUploadThermoPack(UploadThermoPackModel uploadThermoPackModel) async {
    final response = await http.put(
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        },
        Uri.parse("${Constants.connectionString}/urtpadd"),
        body : jsonEncode(<String , String>{
          "date": selectedDate.value.toString(),
          "chambers": chambers.text,
          "coal1": coal1.text,
          "coal2": coal2.text,
          "in_temperature": inTemperature.text,
          "out_temperature": outTemperature.text,
          "pump_pressure": pumpPressure.text,
          "circuit_pressure": circuitPressure.text,

        })
    );
    if(response.statusCode == 200)
      {
        Fluttertoast.showToast(msg: "Data Added SuccessFully" , backgroundColor: Colors.green);
      }
    else {
      Fluttertoast.showToast(msg: "Data Already Exists" ,backgroundColor: Colors.red);
    }
  }
}
