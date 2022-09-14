import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_FlueGas/controllers/upload_flue_gas_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_Machine/controllers/upload_machine_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_ManoMeter/controllers/upload_mano_meter_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_Misc/controllers/upload_misc_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_SteamBoiler/controllers/upload_steam_boiler_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_SupplyPump/controllers/upload_supply_pump_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_ThermoPack/controllers/upload_thermo_pack_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_Utility/controllers/upload_utility_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_WaterQuality/controllers/upload_water_quality_controller.dart';

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
      indexSelection();
      print("Selected Index: ${controller.index}");
    });
  }

  indexSelection() {
    if (selectedIndex == 0) {
      Get.delete<UploadUtilityController>();
      Get.lazyPut(() => UploadUtilityController());
    } else if (selectedIndex == 1) {
      Get.delete<UploadSteamBoilerController>();
      Get.lazyPut(() => UploadSteamBoilerController());
    } else if (selectedIndex == 2) {
      Get.delete<UploadThermoPackController>();
      Get.lazyPut(() => UploadThermoPackController());
    } else if (selectedIndex == 3) {
      Get.delete<UploadMachineController>();
      Get.lazyPut(() => UploadMachineController());
    } else if (selectedIndex == 4) {
      print("Controller Deleted");
      Get.delete<UploadWaterQualityController>();
      Get.lazyPut(() => UploadWaterQualityController());
      print("Controller chalu hai ");
    } else if (selectedIndex == 5) {
      print("Controller Deleted");
      Get.delete<UploadSupplyPumpController>();
      Get.lazyPut(() => UploadSupplyPumpController());
    } else if (selectedIndex == 6) {
      // Get.delete<UploadGEBController>();
      // Get.lazyPut(() => UploadGEBController());
    } else if (selectedIndex == 7) {
      Get.delete<UploadManoMeterController>();
      Get.lazyPut(() => UploadManoMeterController());
    } else if (selectedIndex == 8) {
      Get.delete<UploadFlueGasController>();
      Get.put(UploadFlueGasController());
    } else if (selectedIndex == 9) {
      Get.delete<UploadMiscController>();
      Get.put(UploadMiscController());
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
