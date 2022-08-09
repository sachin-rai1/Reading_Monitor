import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_mano_meter_controller.dart';

class CompareManoMeterView extends GetView<CompareManoMeterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompareManoMeterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompareManoMeterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
