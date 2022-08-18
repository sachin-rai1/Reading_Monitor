import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../data/Constants.dart';
import '../../SupplyPump/providers/http_service_provider.dart';
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
  addSteamBoiler(SteamBoiler steamBoiler) async {
    HttpServiceProvider add = HttpServiceProvider(
        url: "${Constants.connectionString}/mlsbadd",
        body: {
          "bfw1": bfw1.text,
          "bfw2": bfw2.text,
          "coal1": coal1.text,
          "coal1_div": coal1Div.text,
          "rate_of_coal1": rateOfCoal1.text,
          "coal2": coal2.text,
          "coal2_div": coal2Div.text,
          "rate_of_coal2": rateOfCoal2.text,
          "bfw_temperature1": bfwTemperature1.text,
          "bfw_temperature2": bfwTemperature2.text,
          "steam_cost1": steamCost1.text,
          "steam_cost2": steamCost2.text,
        });
        add.post().then((value) {
      if (value.statusCode == 200) {
        Fluttertoast.showToast(
          msg: 'Data Added Successfully',
          backgroundColor: Colors.green,
        );
        ClearData();
        print(value.body);
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
  void ClearData()
  {
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
