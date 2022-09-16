import 'package:get/get.dart';

import 'package:readingmonitor2/app/modules/MachineList/FlueGas/controllers/flue_gas_controller_controller.dart';



class FlueGasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlueGasControllerController>(
      () => FlueGasControllerController(),
    );
    Get.lazyPut<FlueGasControllerController>(
      () => FlueGasControllerController(),
    );
  }
}
