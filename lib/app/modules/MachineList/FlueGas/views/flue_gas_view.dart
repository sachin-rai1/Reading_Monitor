import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/flue_gas_controller.dart';

class FlueGasView extends GetView<FlueGasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlueGasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FlueGasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
