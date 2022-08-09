import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_mano_meter_controller.dart';

class ChartManoMeterView extends GetView<ChartManoMeterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartManoMeterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartManoMeterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
