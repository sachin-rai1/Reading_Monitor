import 'package:get/get.dart';

import '../controllers/report_thermo_pack_controller.dart';

class ReportThermoPackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportThermoPackController>(
      () => ReportThermoPackController(),
    );
  }
}
