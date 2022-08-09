import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/water_quality_controller.dart';

class WaterQualityView extends GetView<WaterQualityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WaterQualityView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WaterQualityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
