import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadTabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = const <Tab>[
    Tab(
        child: Text('Utility',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
    Tab(
        child: Text('Steam Boiler',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
    Tab(
        child: Text('Thermopack',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
    Tab(
        child: Text('Machines',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
    Tab(
        child: Text('WaterQuality',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
    Tab(
        child: Text('SupplyPump',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
    Tab(
        child: Text('GEB',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
    Tab(
        child: Text('ManoMeter',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
    Tab(
        child: Text('FlueGas',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
    Tab(
        child: Text('Misc.',
            style: TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
  ];

  late TabController controller;
  int selectedIndex = 0;


  @override
  void onInit() {
    super.onInit();
    controller = TabController(
        vsync: this, length: myTabs.length, initialIndex: selectedIndex);
    controller.animateTo(selectedIndex);
    controller.addListener(() {
      selectedIndex = controller.index;
      print("Selecting Index");
      // indexSelection();
      print("Selected Index: ${controller.index}");
    });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
