import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/controllers/flue_gas_controller_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/GEB/controllers/geb_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/Machine/controllers/machine_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/controllers/mano_meter_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/Misc/controllers/misc_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/SteamBoiler/controllers/steam_boiler_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/SupplyPump/controllers/supply_pump_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/ThermoPack/controllers/thermo_pack_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/sub_utility_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/utility_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/waterQuality/controllers/water_quality_controller.dart';

class MachineListTabBarController extends GetxController
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
    controller = TabController(vsync: this, length: myTabs.length);
    controller.animateTo(selectedIndex);

  }



  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
