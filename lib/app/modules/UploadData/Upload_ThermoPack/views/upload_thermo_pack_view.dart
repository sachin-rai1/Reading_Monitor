import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_thermo_pack_controller.dart';

class UploadThermoPackView extends GetView<UploadThermoPackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadThermoPackView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadThermoPackView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
