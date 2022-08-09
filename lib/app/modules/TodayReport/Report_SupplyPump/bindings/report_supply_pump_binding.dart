import 'package:get/get.dart';

import '../controllers/report_supply_pump_controller.dart';

class ReportSupplyPumpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportSupplyPumpController>(
      () => ReportSupplyPumpController(),
    );
  }
}
