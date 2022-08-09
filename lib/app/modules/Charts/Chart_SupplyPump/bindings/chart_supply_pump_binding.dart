import 'package:get/get.dart';

import '../controllers/chart_supply_pump_controller.dart';

class ChartSupplyPumpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartSupplyPumpController>(
      () => ChartSupplyPumpController(),
    );
  }
}
