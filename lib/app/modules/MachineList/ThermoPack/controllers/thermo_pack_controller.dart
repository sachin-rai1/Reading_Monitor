import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/ThermoPack/Model/MachineList_Model_ThermoPack.dart';
import '../../../../data/ConnectionString.dart';
import '../../SupplyPump/providers/http_service_provider.dart';

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

  addThermoPack(ThermoPack thermoPack) async {
    HttpServiceProvider add =
    HttpServiceProvider(url: "${Constants.connectionString}/mltpadd",
        body: {
          "coal1": coal1.text,
          "coal1_dev": coal1Dev.text,
          "rate_of_coal1": rateOfCoal1.text,
          "coal2": coal2.text,
          "coal2_dev": coal2Dev.text,
          "rate_of_coal2": rateOfCoal2.text,
          "delta_t1": deltaT1.text,
          "delta_t2": deltaT2.text,
          "chamber_cost1": chamberCost1.text,
          "chamber_cost2": chamberCost2.text,

        });
    add.post().then((value) {
      if (value.statusCode == 200) {
        Constants.showtoast("Data Added!");
      } else {
        print(value.body);
        print(value.statusCode);
        Fluttertoast.showToast(
          msg: 'Error In Adding Data',
          backgroundColor: Colors.red,
        );
      }
    }).catchError((onError) {});
  }
  Future<ThermoPack> updateThermoPack(int id ,int coal1,  int coal1Dev,  int rateOfCoal1,  int coal2,  int coal2Dev,  int rateOfCoal2,  int deltaT1,  int deltaT2,  int chamberCost1,  int chamberCost2) async {
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/mltpadd"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id' : id.toString(),
        "coal1": coal1.toString(),
        "coal1_dev": coal1Dev.toString(),
        "rate_of_coal1": rateOfCoal1.toString(),
        "coal2": coal2.toString(),
        "coal2_dev": coal2Dev.toString(),
        "rate_of_coal2": rateOfCoal2.toString(),
        "delta_t1": deltaT1.toString(),
        "delta_t2": deltaT2.toString(),
        "chamber_cost1": chamberCost1.toString(),
        "chamber_cost2": chamberCost2.toString(),
      }),
    );
    if (response.statusCode == 200) {
      Constants.showtoast("Data Updated!");
      return ThermoPack.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to update Data.');
    }
  }
  Future<ThermoPack> fetchThermoPack() async {
    final response = await http.get(
      Uri.parse("${Constants.connectionString}/mltplist"),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ThermoPack.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}
