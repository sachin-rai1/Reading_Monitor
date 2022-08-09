import 'package:get/get.dart';

import '../controllers/machine_controller.dart';

class MachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MachineController>(
      () => MachineController(),
    );
  }
}
