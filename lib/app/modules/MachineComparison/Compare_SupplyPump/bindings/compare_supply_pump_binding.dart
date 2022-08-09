import 'package:get/get.dart';

import '../controllers/compare_supply_pump_controller.dart';

class CompareSupplyPumpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareSupplyPumpController>(
      () => CompareSupplyPumpController(),
    );
  }
}
