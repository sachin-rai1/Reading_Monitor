import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/Model/ModelFlueGasSteamBoiler.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/Model/ModelFlueGasThermoPack.dart';

import '../../../../data/http_service_provider.dart';

class FlueGasControllerController extends GetxController {
  TextEditingController steamBoiler = TextEditingController();
  TextEditingController thermoPack = TextEditingController();
  var isLoading = true.obs;
  var isLoadingThermopack = true.obs;
  var steamBoilermachineList = <ModelFlueGasSteamBoiler>[].obs;
  var thermoPackmachineList = <ModelFlueGasThermopack>[].obs;

  @override
  void onInit() {

    print("Hii this is !!  FlueGasController  Initialized");
    fetchFlueGasSteamBoiler();
    fetchFlueGasThermoPack();
    super.onInit();
  }
  // @override
  // void onClose() {
  //   fetchFlueGasSteamBoiler();
  //   fetchFlueGasThermoPack();
  //   super.onClose();
  // }

  Future<void> fetchFlueGasSteamBoiler() async {
    try {
      isLoading(true);
      var flueGasSteamBoiler = await HttpServiceProvider.fetchFlueGasSteamBoiler();
      steamBoilermachineList.value = flueGasSteamBoiler;
    }
    finally {
      isLoading(false);
    }
  }

  Future<void> fetchFlueGasThermoPack() async {
    try {
      isLoadingThermopack(true);
      var flueGasThermoPack = await HttpServiceProvider
          .fetchFlueGasThermopack();
      thermoPackmachineList.value = flueGasThermoPack;
    }
    finally {
      isLoadingThermopack(false);
    }
  }

}
