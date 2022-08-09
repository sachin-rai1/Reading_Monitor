import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_supply_pump_controller.dart';

class UploadSupplyPumpView extends GetView<UploadSupplyPumpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadSupplyPumpView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadSupplyPumpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
