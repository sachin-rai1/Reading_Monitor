import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:readingmonitor2/app/data/Constants.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/Model/ModelManoMeterSteamBoiler.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/Model/ModelManoMeterThermoPack.dart';
import 'package:readingmonitor2/app/modules/MachineList/Misc/Model/ModelMiscMachineList.dart';
import 'package:readingmonitor2/app/modules/MachineList/SteamBoiler/Model/MachineList_Model_SteamBoiler.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/Model/ModelUtilityMachineList.dart';
import 'package:readingmonitor2/app/modules/MachineList/WaterQuality/Model/ModelWaterQuality.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_GEB/Model/ModelUploadGeb.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_SupplyPump/Model/ModelUploadSupplyPump.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/MachineList/Machine/Model/ModelMachineList.dart';

class HttpServiceProvider extends GetConnect {


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

  static Future<List<ModelManoMeterThermoPack>>
      fetchManometerThermopack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    print(tokenvalue);
    var response = await http.get(
      Uri.parse("${Constants.connectionString}/ManoMeterThermopackLisiting"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      print(data);
      return modelManoMeterThermoPackFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }

  static Future<List<ModelManoMeterSteamBoiler>>
      fetchManometerSteamBoiler() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    print(tokenvalue);
    var response = await http.get(
      Uri.parse("${Constants.connectionString}/ManoMeterSteamBoilerLisiting"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      print(data);
      return modelManoMeterSteamBoilerFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }
  static Future<List<ModelMachineMisc>>
  fetchMiscMachineList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    print(tokenvalue);
    var response = await http.get(
      Uri.parse("${Constants.connectionString}/MiscLisiting"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      return modelMachineMiscFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }

  static Future<List<ModelSteamBoiler>> fetchSteamBoilerList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    print(tokenvalue);
    var response = await http.get(
      Uri.parse("${Constants.connectionString}/SteamBolierListing"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      print(data);
      return modelSteamBoilerFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }

  static Future<List<ModelUploadGeb>> fetchUploadGebList() async {
    var selectedDate = DateTime.now().obs;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse("${Constants.connectionString}/UploadReportGebSharch/${selectedDate.toString().split(" ")[0]}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      print(data);
      return modelUploadGebFromJson(data);
    } else {
      print(response.statusCode);
      print(response.body);

      throw Exception();
    }
  }


}
