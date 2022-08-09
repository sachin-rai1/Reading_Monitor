import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_flue_gas_controller.dart';

class ReportFlueGasView extends GetView<ReportFlueGasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReportFlueGasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReportFlueGasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
