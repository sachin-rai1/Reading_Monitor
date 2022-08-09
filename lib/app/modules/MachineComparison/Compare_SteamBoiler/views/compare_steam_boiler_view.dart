import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compare_steam_boiler_controller.dart';

class CompareSteamBoilerView extends GetView<CompareSteamBoilerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompareSteamBoilerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompareSteamBoilerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
