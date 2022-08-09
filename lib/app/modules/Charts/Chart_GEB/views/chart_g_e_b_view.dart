import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_g_e_b_controller.dart';

class ChartGEBView extends GetView<ChartGEBController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartGEBView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartGEBView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
