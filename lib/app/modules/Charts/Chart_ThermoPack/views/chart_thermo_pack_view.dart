import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_thermo_pack_controller.dart';

class ChartThermoPackView extends GetView<ChartThermoPackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartThermoPackView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartThermoPackView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
