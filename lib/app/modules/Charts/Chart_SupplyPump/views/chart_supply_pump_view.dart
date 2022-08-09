import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_supply_pump_controller.dart';

class ChartSupplyPumpView extends GetView<ChartSupplyPumpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartSupplyPumpView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartSupplyPumpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
