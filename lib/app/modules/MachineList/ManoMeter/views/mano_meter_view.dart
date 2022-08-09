import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mano_meter_controller.dart';

class ManoMeterView extends GetView<ManoMeterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ManoMeterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ManoMeterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
