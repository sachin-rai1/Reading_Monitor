import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_steam_boiler_controller.dart';

class ChartSteamBoilerView extends GetView<ChartSteamBoilerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartSteamBoilerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartSteamBoilerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
