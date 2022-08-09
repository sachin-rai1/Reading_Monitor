import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_flue_gas_controller.dart';

class UploadFlueGasView extends GetView<UploadFlueGasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadFlueGasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadFlueGasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
