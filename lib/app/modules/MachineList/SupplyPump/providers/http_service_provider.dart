import 'package:http/http.dart' as http;
import 'package:readingmonitor2/app/data/ConnectionString.dart';
import '../Model/SupplyPumpModel.dart';

class HttpServiceProvider // extends GetConnect
    {
  final dynamic url;
  final dynamic body;
  final dynamic header;

  static Future<List<SupplyPump>> fetchSupplyPump() async {
    var response =
    await http.get(Uri.parse("${Constants.connectionString}/spilist"));
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      return supplyPumpFromJson(data);
    } else {
      throw Exception();
    }
  }


  HttpServiceProvider({required this.body, required this.url ,this.header});

  Future<http.Response> post() {
    return http.post(Uri.parse(url),
        body: body).timeout(const Duration(minutes: 2));
   }



}
