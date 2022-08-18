import 'package:http/http.dart' as http;
import 'package:readingmonitor2/app/data/Constants.dart';
import 'package:readingmonitor2/app/modules/MachineList/GEB/Model/MachineList_GEB_Model.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/Model/ModelUtilityMachineList.dart';
import 'package:readingmonitor2/app/modules/MachineList/WaterQuality/Model/ModelWaterQuality.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/MachineList/Machine/Model/ModelMachineList.dart';
class HttpServiceProvider
{
  final dynamic url;
  final dynamic body;
  final dynamic header;
  //
  // static Future<List<SupplyPump>> fetchSupplyPump() async {
  //   var response =
  //       await http.get(Uri.parse("${Constants.connectionString}/spilist"));
  //   if (response.statusCode == 200) {
  //     var data = response.body;
  //     print(data);
  //     return supplyPumpFromJson(data);
  //   } else {
  //     throw Exception();
  //   }
  // }

  static Future<List<ModelMachineList>> fetchMachinelist() async {
    var response =
        await http.get(Uri.parse("${Constants.connectionString}/mclist"));
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      return modelMachineListFromJson(data);
    } else {
      throw Exception();
    }
  }

  HttpServiceProvider({required this.body, required this.url, this.header});

  Future<http.Response> post() {
    return http
        .post(Uri.parse(url), body: body)
        .timeout(const Duration(minutes: 2));
  }

  static Future<List<ModelUtilityMachineList>> fetchUtilityMachinelist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    print(tokenvalue);
    var response = await http.get(
      Uri.parse("${Constants.connectionString}/GetUtilityLisiting"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      print(data);
      return modelUtilityMachineListFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }

  static Future<List<ModelWaterQuality>> fetchWaterQualityList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    print(tokenvalue);
    var response = await http.get(
      Uri.parse("${Constants.connectionString}/GetWaterQualityLisiting"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      print(data);
      return modelWaterQualityFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }


}
