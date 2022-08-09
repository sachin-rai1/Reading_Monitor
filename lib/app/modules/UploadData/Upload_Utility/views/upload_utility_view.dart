import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_utility_controller.dart';

class UploadUtilityView extends GetView<UploadUtilityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadUtilityView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadUtilityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
