import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_machine_controller.dart';

class UploadMachineView extends GetView<UploadMachineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadMachineView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadMachineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
