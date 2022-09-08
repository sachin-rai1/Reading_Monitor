import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/data/http_service_provider.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/Model/ModelManoMeterSteamBoiler.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/Model/ModelManoMeterThermoPack.dart';

class ManoMeterController extends GetxController {
  TextEditingController steamBoiler = TextEditingController();
  TextEditingController thermoPack = TextEditingController();

  var isLoading = true.obs;
  var isLoadingThermopack = true.obs;
  var steamBoilermachineList = <ModelManoMeterSteamBoiler>[].obs;
  var thermoPackmachineList = <ModelManoMeterThermoPack>[].obs;
  @override
  void onInit() {
    fetchManometerSteamBoiler();
    fetchManomterThermoPack();
    super.onInit();
  }
  @override
  void onClose() {
    fetchManometerSteamBoiler();
    fetchManomterThermoPack();
    super.onClose();
  }

  Future<void> fetchManometerSteamBoiler() async {
    try {
      isLoading(true);
      var manoMeterSteamBoiler = await HttpServiceProvider
          .fetchManometerSteamBoiler();
      steamBoilermachineList.value = manoMeterSteamBoiler;
    }
    finally {
      isLoading(false);
    }
  }

  Future<void> fetchManomterThermoPack() async {
    try {
      isLoadingThermopack(true);
      var manoMeterThermoPack = await HttpServiceProvider
          .fetchManometerThermopack();
      thermoPackmachineList.value = manoMeterThermoPack;
    }
    finally {
      isLoadingThermopack(false);
    }
  }


}
