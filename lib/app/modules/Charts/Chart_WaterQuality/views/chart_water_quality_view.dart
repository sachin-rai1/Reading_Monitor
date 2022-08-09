import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_water_quality_controller.dart';

class ChartWaterQualityView extends GetView<ChartWaterQualityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartWaterQualityView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartWaterQualityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
