import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/Constants.dart';
import 'package:http/http.dart' as http;
import '../../../../data/http_service_provider.dart';
import '../Model/MachineList_Model_SteamBoiler.dart';

class SteamBoilerController extends GetxController {
  TextEditingController bfw1 = TextEditingController();
  TextEditingController bfw2 = TextEditingController();
  TextEditingController coal1 = TextEditingController();
  TextEditingController coal1Div = TextEditingController();
  TextEditingController rateOfCoal1 = TextEditingController();
  TextEditingController coal2 = TextEditingController();
  TextEditingController coal2Div = TextEditingController();
  TextEditingController rateOfCoal2 = TextEditingController();
  TextEditingController bfwTemperature1 = TextEditingController();
  TextEditingController bfwTemperature2 = TextEditingController();
  TextEditingController steamCost1 = TextEditingController();
  TextEditingController steamCost2 = TextEditingController();
  int id = 1;

  addSteamBoiler(ModelSteamBoiler steamBoiler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
      Uri.parse("${Constants.connectionString}/SteamBolierAdd"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        "bfw": bfw1.text,
        "temperature": bfw2.text,
        "bfw_percentage": bfwTemperature1.text,
        "bfw_temperature_percentage": bfwTemperature2.text,
        "coal_1": coal1.text,
        "coal_2": coal2.text,
        "coal_deviation_1": coal1Div.text,
        "coal_deviation_2": coal2Div.text,
        "rate_of_coal_1": rateOfCoal1.text,
        "rate_of_coal_2": rateOfCoal2.text,
        "steam_cost": steamCost1.text,
        "steam_cost_percentage": steamCost2.text,
      }),
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: 'Data Added Successfully',
        backgroundColor: Colors.green,
      );
      clearData();
      print(response.body);
    } else {
      print(response.body);
      print(response.statusCode);
      Fluttertoast.showToast(
        msg: 'Error In Adding Data',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<ModelSteamBoiler?> updateSteamBoiler(
      int bfw,
      int temp,
      int bfwper,
      int bfwTempPer,
      int c1,
      int c1d,
      int roc1,
      int c2,
      int c2d,
      int roc2,
      int sc,
      int scPer,
      int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/SteamBolierUpadated/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        '_method': "PUT",
        "id": id.toString(),
        "bfw": bfw.toString(),
        "temperature": temp.toString(),
        "bfw_percentage": bfwper.toString(),
        "bfw_temperature_percentage": bfwTempPer.toString(),
        "coal_1": c1.toString(),
        "coal_2": c2.toString(),
        "coal_deviation_1": c1d.toString(),
        "coal_deviation_2": c2d.toString(),
        "rate_of_coal_1": roc1.toString(),
        "rate_of_coal_2": roc2.toString(),
        "steam_cost": sc.toString(),
        "steam_cost_percentage": scPer.toString(),
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      return null;
    } else {
      throw Exception('Failed to update Data.');
    }
  }

  @override
  void onInit() {
    fetchSteamBoilerList();
    super.onInit();
  }

  var isLoading = true.obs;
  var steamBoilerList = <ModelSteamBoiler>[].obs;

  void fetchSteamBoilerList() async {
    try {
      isLoading(true);
      var steamBoiler = await HttpServiceProvider.fetchSteamBoilerList();
      steamBoilerList.value = steamBoiler;
      if (steamBoilerList.isNotEmpty) {
        bfw1.text = steamBoilerList[0].bfw.toString();
        bfw2.text = steamBoilerList[0].temperature.toString();
        bfwTemperature1.text = steamBoilerList[0].bfwPercentage.toString();
        bfwTemperature2.text =
            steamBoilerList[0].bfwTemperaturePercentage.toString();
        coal1.text = steamBoilerList[0].coal1.toString();
        coal2.text = steamBoilerList[0].coal2.toString();
        coal1Div.text = steamBoilerList[0].coalDeviation1.toString();
        coal2Div.text = steamBoilerList[0].coalDeviation2.toString();
        rateOfCoal1.text = steamBoilerList[0].rateOfCoal1.toString();
        rateOfCoal2.text = steamBoilerList[0].rateOfCoal2.toString();
        steamCost1.text = steamBoilerList[0].steamCost.toString();
        steamCost2.text = steamBoilerList[0].steamCostPercentage.toString();
      }
    } finally {
      isLoading(false);
    }
  }

  Future<Future<bool?>?> fetchSteamBoiler() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.get(
      Uri.parse("${Constants.connectionString}/SteamBolierListing"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      if (data.length == 0) {
        addSteamBoiler(ModelSteamBoiler(
            bfw: int.parse(bfw1.text),
            bfwPercentage: int.parse(bfw2.text),
            coal1: int.parse(coal1.text),
            coalDeviation1: int.parse(coal1Div.text),
            rateOfCoal1: int.parse(rateOfCoal1.text),
            coal2: int.parse(coal2.text),
            coalDeviation2: int.parse(coal2Div.text),
            rateOfCoal2: int.parse(rateOfCoal2.text),
            temperature: int.parse(bfwTemperature1.text),
            bfwTemperaturePercentage: int.parse(bfwTemperature2.text),
            steamCost: int.parse(steamCost1.text),
            steamCostPercentage: int.parse(steamCost2.text)));
        print("Added");
        fetchSteamBoilerList();
        print(data);
      } else {
        print("Updated");
        print(id);
        updateSteamBoiler(
            int.parse(bfw1.text.toString()),
            int.parse(bfw2.text.toString()),
            int.parse(bfwTemperature1.text.toString()),
            int.parse(bfwTemperature2.text.toString()),
            int.parse(coal1.text.toString()),
            int.parse(coal2.text.toString()),
            int.parse(coal1Div.text.toString()),
            int.parse(coal2Div.text.toString()),
            int.parse(rateOfCoal1.text.toString()),
            int.parse(rateOfCoal2.text.toString()),
            int.parse(steamCost1.text.toString()),
            int.parse(steamCost2.text.toString()),
            int.parse(id.toString()));
        clearData();
        fetchSteamBoilerList();

        print(response.body);
        print(data);
      }
    }
    return null;
  }

  void clearData() {
    bfw1.clear();
    bfw2.clear();
    steamCost2.clear();
    steamCost1.clear();
    bfwTemperature2.clear();
    bfwTemperature1.clear();
    rateOfCoal2.clear();
    rateOfCoal1.clear();
    coal1Div.clear();
    coal2Div.clear();
    coal1.clear();
    coal2.clear();
  }
}
