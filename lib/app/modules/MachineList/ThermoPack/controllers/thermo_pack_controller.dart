import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/ThermoPack/Model/MachineList_Model_ThermoPack.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/Constants.dart';

class ThermoPackController extends GetxController {
  TextEditingController coal1 = TextEditingController();
  TextEditingController coal1Dev = TextEditingController();
  TextEditingController rateOfCoal1 = TextEditingController();
  TextEditingController coal2 = TextEditingController();
  TextEditingController coal2Dev = TextEditingController();
  TextEditingController rateOfCoal2 = TextEditingController();
  TextEditingController deltaT1 = TextEditingController();
  TextEditingController deltaT2 = TextEditingController();
  TextEditingController chamberCost1 = TextEditingController();
  TextEditingController chamberCost2 = TextEditingController();

  addThermoPack(ModelThermoPack thermoPack) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
      Uri.parse("${Constants.connectionString}/ThermoopackAdd"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        "coal_1": coal1.text,
        "coal_deviation1": coal1Dev.text,
        "rate_of_cloal1": rateOfCoal1.text,
        "coal_2": coal2.text,
        "coal_deviation2": coal2Dev.text,
        "rate_of_coal2": rateOfCoal2.text,
        "delta_t": deltaT1.text,
        "delta_t_percentage": deltaT2.text,
        "chamber_cost": chamberCost1.text,
        "chamber_cost_percentage": chamberCost2.text,
      }),
    );

    if (response.statusCode == 200) {
      Constants.showtoast("Data Added!");
      // print(response.body);

      clearData();
    } else {
      // print(response.body);
      print(response.statusCode);
      Fluttertoast.showToast(
        msg: 'Error In Adding Data',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<ModelThermoPack?> updateThermoPack(
    int coal1,
    int coal1Dev,
    int rateOfCoal1,
    int coal2,
    int coal2Dev,
    int rateOfCoal2,
    int deltaT1,
    int deltaT2,
    int chamberCost1,
    int chamberCost2,
    // int id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/ThermoopackUpdated"),
      body: jsonEncode(<String, String>{
        '_method': "PUT",
        // "id": id.toString(),
        "coal_1": coal1.toString(),
        "coal_deviation1": coal1Dev.toString(),
        "rate_of_cloal1": rateOfCoal1.toString(),
        "coal_2": coal2.toString(),
        "coal_deviation2": coal2Dev.toString(),
        "rate_of_coal2": rateOfCoal2.toString(),
        "delta_t": deltaT1.toString(),
        "delta_t_percentage": deltaT2.toString(),
        "chamber_cost": chamberCost1.toString(),
        "chamber_cost_percentage": chamberCost2.toString(),
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      return null;
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  Future<List<ModelThermoPack>?> fetchThermoPackList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.get(
      Uri.parse("${Constants.connectionString}/ThermopackListing"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      coal1.text = data[0]["coal_1"].toString();
      coal1Dev.text = data[0]["coal_deviation1"].toString();
      rateOfCoal1.text = data[0]["rate_of_cloal1"].toString();
      coal2.text = data[0]["coal_2"].toString();
      coal2Dev.text = data[0]["coal_deviation2"].toString();
      rateOfCoal2.text = data[0]["rate_of_coal2"].toString();
      deltaT1.text = data[0]["delta_t"].toString();
      deltaT2.text = data[0]["delta_t_percentage"].toString();
      chamberCost1.text = data[0]["chamber_cost"].toString();
      chamberCost2.text = data[0]["chamber_cost_percentage"].toString();

      return modelThermoPackFromJson(response.body);
    }
    return null;
  }

  @override
  void onInit() {
    fetchThermoPackList();
    super.onInit();
  }

  Future<Future<bool?>?> fetchThermoPack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.get(
      Uri.parse("${Constants.connectionString}/ThermopackListing"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      if (data.length == 0) {
        addThermoPack(ModelThermoPack(
            coal1: int.parse(coal1.text),
            coalDeviation1: int.parse(coal1Dev.text),
            rateOfCloal1: int.parse(rateOfCoal1.text),
            coal2: int.parse(coal2.text),
            coalDeviation2: int.parse(coal2Dev.text),
            rateOfCoal2: int.parse(rateOfCoal2.text),
            delta: int.parse(deltaT1.text),
            deltaTPercentage: int.parse(deltaT2.text),
            chamberCost: int.parse(chamberCost1.text),
            chamberCostPercentage: int.parse(chamberCost2.text)));
        print("Added");
      } else {
        print("Updated");
        updateThermoPack(
          int.parse(coal1.text.toString()),
          int.parse(coal1Dev.text.toString()),
          int.parse(rateOfCoal1.text.toString()),
          int.parse(coal2.text.toString()),
          int.parse(coal2Dev.text.toString()),
          int.parse(rateOfCoal2.text.toString()),
          int.parse(deltaT1.text.toString()),
          int.parse(deltaT2.text.toString()),
          int.parse(chamberCost1.text.toString()),
          int.parse(chamberCost2.text.toString()),
          // int.parse(id.toString()),
        );
        print(response.body);
      }
    }
    return null;
  }

  clearData() {
    coal1.clear();
    coal1Dev.clear();
    rateOfCoal1.clear();
    coal2.clear();
    coal2Dev.clear();
    rateOfCoal2.clear();
    deltaT1.clear();
    deltaT2.clear();
    chamberCost1.clear();
    chamberCost2.clear();
  }
}
