import 'package:get/get.dart';

import '../controllers/chart_machine_controller.dart';

class ChartMachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartMachineController>(
      () => ChartMachineController(),
    );
  }
}
