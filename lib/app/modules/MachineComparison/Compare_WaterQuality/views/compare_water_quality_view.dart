import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_water_quality_controller.dart';

class CompareWaterQualityView extends GetView<CompareWaterQualityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompareWaterQualityView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompareWaterQualityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
