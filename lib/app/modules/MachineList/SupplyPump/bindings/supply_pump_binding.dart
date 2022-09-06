import 'package:get/get.dart';

import '../controllers/supply_pump_controller.dart';

class SupplyPumpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SupplyPumpController(),
    );
  }
}
