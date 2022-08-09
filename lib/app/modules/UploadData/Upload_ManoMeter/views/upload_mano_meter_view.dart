import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_mano_meter_controller.dart';

class UploadManoMeterView extends GetView<UploadManoMeterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadManoMeterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadManoMeterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
