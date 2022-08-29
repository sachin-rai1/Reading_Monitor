import 'package:http/http.dart' as http;
import 'package:readingmonitor2/app/data/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Machine/Model/ModelMachineList.dart';
import '../Model/SupplyPumpModel.dart';

class HttpServiceProvider // extends GetConnect
{
  // final dynamic url;
  // final dynamic body;
  // final dynamic header;

  static Future<List<ModelSupplyPump>> fetchSupplyPump() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse("${Constants.connectionString}/GetSupplyPumpListing"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      return modelSupplyPumpFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<ModelMachineList>> fetchMachinelist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse("${Constants.connectionString}/GetMachineCategoriesListing"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      return modelMachineListFromJson(data);
    } else {
      throw Exception();
    }
  }

  // HttpServiceProvider({required this.body, required this.url, this.header});
  //
  // Future<http.Response> post() {
  //   return http
  //       .post(Uri.parse(url), body: body)
  //       .timeout(const Duration(minutes: 2));
  // }
}
