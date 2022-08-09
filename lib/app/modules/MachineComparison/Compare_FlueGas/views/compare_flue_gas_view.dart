import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_flue_gas_controller.dart';

class CompareFlueGasView extends GetView<CompareFlueGasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompareFlueGasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompareFlueGasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
