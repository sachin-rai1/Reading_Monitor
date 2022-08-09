import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_water_quality_controller.dart';

class UploadWaterQualityView extends GetView<UploadWaterQualityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadWaterQualityView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadWaterQualityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
