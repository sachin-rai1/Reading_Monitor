import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/machine_controller.dart';

class MachineView extends GetView<MachineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MachineView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MachineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
