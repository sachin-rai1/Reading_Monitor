import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/GEB/Model/MachineList_GEB_Model.dart';
import 'package:readingmonitor2/app/modules/MachineList/SupplyPump/providers/http_service_provider.dart';

import '../../../../data/ConnectionString.dart';

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

  addGeb(GebModel gebModel) {
    HttpServiceProvider add = HttpServiceProvider(body: {
      "kwh": kwh.text,
      "dev_kwh": devKwh.text,
      "kvarh": kvarh.text,
      "dev_kvarh": devKvarh.text,
      "kvah": kvah.text,
      "dev_kvah": devKvah.text,
      "pf": pf.text,
      "dev_pf": devPf.text,
      "md": md.text,
      "dev_md": devMd.text,
      "mf": mf.text,
      "tb": tb.text,
      "dev_tb": devTb.text,
    },
        url: "${Constants.connectionString}/gebadd");
    add.post().then((value) {
      if (value.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Data Added Successfully', backgroundColor: Colors.green);
        print(value.body);
      } else {
        Fluttertoast.showToast(
            msg: "Error Adding Data", backgroundColor: Colors.red);
      }
    }).catchError((onError){});
  }
}
