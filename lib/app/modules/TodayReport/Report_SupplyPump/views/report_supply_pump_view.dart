import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_supply_pump_controller.dart';

class ReportSupplyPumpView extends GetView<ReportSupplyPumpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReportSupplyPumpView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReportSupplyPumpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
