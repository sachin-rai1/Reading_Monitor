import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_flue_gas_controller.dart';

class ChartFlueGasView extends GetView<ChartFlueGasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartFlueGasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartFlueGasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
