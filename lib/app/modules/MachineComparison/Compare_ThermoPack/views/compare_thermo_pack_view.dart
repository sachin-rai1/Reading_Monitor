import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_thermo_pack_controller.dart';

class CompareThermoPackView extends GetView<CompareThermoPackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompareThermoPackView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompareThermoPackView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
