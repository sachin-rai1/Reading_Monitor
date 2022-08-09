import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_steam_boiler_controller.dart';

class UploadSteamBoilerView extends GetView<UploadSteamBoilerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadSteamBoilerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadSteamBoilerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
