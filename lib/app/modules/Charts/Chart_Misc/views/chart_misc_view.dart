import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_misc_controller.dart';

class ChartMiscView extends GetView<ChartMiscController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartMiscView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartMiscView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
