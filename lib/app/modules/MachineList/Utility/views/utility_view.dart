import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/utility_controller.dart';

class UtilityView extends GetView<UtilityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UtilityView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UtilityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
