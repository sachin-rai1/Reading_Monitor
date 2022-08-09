import 'package:get/get.dart';

import '../controllers/report_g_e_b_controller.dart';

class ReportGEBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportGEBController>(
      () => ReportGEBController(),
    );
  }
}
