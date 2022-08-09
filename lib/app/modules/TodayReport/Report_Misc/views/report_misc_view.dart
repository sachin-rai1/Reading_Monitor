import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_misc_controller.dart';

class ReportMiscView extends GetView<ReportMiscController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReportMiscView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReportMiscView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
