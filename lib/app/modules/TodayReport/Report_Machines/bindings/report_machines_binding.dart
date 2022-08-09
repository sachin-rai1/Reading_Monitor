import 'package:get/get.dart';

import '../controllers/report_machines_controller.dart';

class ReportMachinesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportMachinesController>(
      () => ReportMachinesController(),
    );
  }
}
