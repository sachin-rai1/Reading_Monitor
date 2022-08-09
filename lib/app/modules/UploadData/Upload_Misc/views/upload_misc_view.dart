import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_misc_controller.dart';

class UploadMiscView extends GetView<UploadMiscController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadMiscView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadMiscView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
