import 'package:flutter/material.dart';
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
  var isLoading = true.obs;

  Future<List<ModelUtilitySubMachineList>> fetchSubUtilityMachinelist(int id) async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var tokenvalue = prefs.getString("token");
      var response = await http.get(
        Uri.parse(
            "${Constants.connectionString}/UtiltiSubCategoriesSingleGet/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenvalue',
        },
      );
      if (response.statusCode == 200) {
        String data = response.body;
        print(response.statusCode);
        print(data);
        return modelUtilitySubMachineListFromJson(data);
      } else {
        print(response.statusCode);
        print(response.body);

        throw Exception();
      }
    } finally {
      isLoading(false);
    }
  }
}
