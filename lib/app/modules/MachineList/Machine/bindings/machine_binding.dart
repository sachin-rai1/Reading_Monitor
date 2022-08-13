import 'package:get/get.dart';

import 'package:readingmonitor2/app/modules/MachineList/Machine/controllers/sub_machine_controller_controller.dart';

import '../controllers/machine_controller.dart';

class MachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubMachineControllerController>(
      () => SubMachineControllerController(),
    );
    Get.lazyPut<MachineController>(
      () => MachineController(),
    );
  }
}
