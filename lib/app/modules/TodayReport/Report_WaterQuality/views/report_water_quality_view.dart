import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_water_quality_controller.dart';

class ReportWaterQualityView extends GetView<ReportWaterQualityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReportWaterQualityView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReportWaterQualityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
