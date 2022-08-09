import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_g_e_b_controller.dart';

class CompareGEBView extends GetView<CompareGEBController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompareGEBView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompareGEBView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
