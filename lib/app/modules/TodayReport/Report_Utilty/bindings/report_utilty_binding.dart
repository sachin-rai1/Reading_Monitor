import 'package:get/get.dart';

import '../controllers/report_utilty_controller.dart';

class ReportUtiltyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportUtiltyController>(
      () => ReportUtiltyController(),
    );
  }
}
