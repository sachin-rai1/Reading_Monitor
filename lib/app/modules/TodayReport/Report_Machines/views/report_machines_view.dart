import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_machines_controller.dart';

class ReportMachinesView extends GetView<ReportMachinesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReportMachinesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReportMachinesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
