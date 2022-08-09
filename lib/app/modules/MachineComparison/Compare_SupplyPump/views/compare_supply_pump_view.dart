import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_supply_pump_controller.dart';

class CompareSupplyPumpView extends GetView<CompareSupplyPumpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompareSupplyPumpView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompareSupplyPumpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
