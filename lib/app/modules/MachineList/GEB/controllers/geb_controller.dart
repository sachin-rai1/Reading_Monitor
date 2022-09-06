import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/GEB/Model/MachineList_GEB_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../data/Constants.dart';

class GebController extends GetxController {
  TextEditingController kwh = TextEditingController();
  TextEditingController devKwh = TextEditingController();
  TextEditingController kvarh = TextEditingController();
  TextEditingController devKvarh = TextEditingController();
  TextEditingController kvah = TextEditingController();
  TextEditingController devKvah = TextEditingController();
  TextEditingController pf = TextEditingController();
  TextEditingController devPf = TextEditingController();
  TextEditingController md = TextEditingController();
  TextEditingController devMd = TextEditingController();
  TextEditingController mf = TextEditingController();
  TextEditingController tb = TextEditingController();
  TextEditingController devTb = TextEditingController();

  addGeb(GebModel gebModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.post(
      Uri.parse("${Constants.connectionString}/GebAdd"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
      body: jsonEncode(<String, String>{
        "kwh": kwh.text,
        "kwm_deviation": devKwh.text,
        "kvarh": kvarh.text,
        "kvarsh_deviation": devKvarh.text,
        "kevah": kvah.text,
        "kevah_deviation": devKvah.text,
        "pf": pf.text,
        "pf_deviation": devPf.text,
        "md": md.text,
        "md_deviation": devMd.text,
        "turbine": tb.text,
        "turbine_deviation": devTb.text,
        "mf": mf.text,
      }),
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: 'Data Added Successfully', backgroundColor: Colors.green);
      print(response.body);
    } else {
      Fluttertoast.showToast(
          msg: "Error Adding Data", backgroundColor: Colors.red);
    }
  }

  Future<GebModel?> updateGebMachine(
      int kwh1,
      int kwmdev,
      int kvar,
      int Udevkvarh,
      int kevah,
      int devkevah,
      int Upf,
      int Udevpf,
      int Umd,
      int Udevmd,
      int Utb,
      int UdevTb,
      int Umf,
      int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    final response = await http.put(
      Uri.parse("${Constants.connectionString}/GebUpdated/$id"),
      body: jsonEncode(<String, String>{
        '_method': "PUT",
        "id": id.toString(),
        "kwh": kwh1.toString(),
        "kwm_deviation": kwmdev.toString(),
        "kvarh": kvar.toString(),
        "kvarsh_deviation": Udevkvarh.toString(),
        "kevah": kevah.toString(),
        "kevah_deviation": devkevah.toString(),
        "pf": Upf.toString(),
        "pf_deviation": Udevpf.toString(),
        "md": Umd.toString(),
        "md_deviation": Udevmd.toString(),
        "turbine": Utb.toString(),
        "turbine_deviation": UdevTb.toString(),
        "mf": Umf.toString(),
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Machine Updated", backgroundColor: Colors.green);
    } else {
      Fluttertoast.showToast(
          msg: "Error in Update", backgroundColor: Colors.red);
      print(response.body);
    }
    return null;
  }

  @override
  void onInit() {
    fetchGebList(1);
    super.onInit();
  }

  Future<Future<bool?>?> fetchGebList(int id) async {
    print(id.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenvalue = prefs.getString("token");
    var response = await http.get(
      Uri.parse('${Constants.connectionString}/GetGebSingleQuery/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenvalue',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      if (data.length == 0) {
        print(response.body);
        addGeb(GebModel(
          kwh: int.parse(kwh.text),
          kwmDeviation: int.parse(devKwh.text),
          kvarh: int.parse(kvarh.text),
          kvarshDeviation: int.parse(devKvarh.text),
          kevah: int.parse(kvah.text),
          kevahDeviation: int.parse(devKvah.text),
          pf: int.parse(pf.text),
          pfDeviation: int.parse(devPf.text),
          md: int.parse(md.text),
          mdDeviation: int.parse(devMd.text),
          turbine: int.parse(tb.text),
          turbineDeviation: int.parse(devTb.text),
          mf: int.parse(mf.text),
        ));
        print("Data Added");
      } else {
        updateGebMachine(
            int.parse(kwh.text.toString()),
            int.parse(devKwh.text.toString()),
            int.parse(kvarh.text.toString()),
            int.parse(devKvarh.text.toString()),
            int.parse(kvah.text.toString()),
            int.parse(devKvah.text.toString()),
            int.parse(pf.text.toString()),
            int.parse(devPf.text.toString()),
            int.parse(md.text.toString()),
            int.parse(devMd.text.toString()),
            int.parse(tb.text.toString()),
            int.parse(devTb.text.toString()),
            int.parse(mf.text.toString()),
            int.parse(id.toString()));
        print("Data Updated");
      }
    }
    return null;
  }
}
