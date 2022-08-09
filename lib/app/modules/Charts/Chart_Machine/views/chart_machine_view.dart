import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_machine_controller.dart';

class ChartMachineView extends GetView<ChartMachineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartMachineView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartMachineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
