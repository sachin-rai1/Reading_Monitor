import 'package:get/get.dart';

import '../controllers/report_flue_gas_controller.dart';

class ReportFlueGasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportFlueGasController>(
      () => ReportFlueGasController(),
    );
  }
}
