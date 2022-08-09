import 'package:get/get.dart';

import '../controllers/compare_machine_controller.dart';

class CompareMachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareMachineController>(
      () => CompareMachineController(),
    );
  }
}
