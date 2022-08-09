import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_machine_controller.dart';

class CompareMachineView extends GetView<CompareMachineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompareMachineView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompareMachineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
