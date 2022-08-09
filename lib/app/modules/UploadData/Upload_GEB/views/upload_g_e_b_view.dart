import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_g_e_b_controller.dart';

class UploadGEBView extends GetView<UploadGEBController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadGEBView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadGEBView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
