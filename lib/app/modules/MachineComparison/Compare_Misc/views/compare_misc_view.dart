import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_misc_controller.dart';

class CompareMiscView extends GetView<CompareMiscController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompareMiscView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompareMiscView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
