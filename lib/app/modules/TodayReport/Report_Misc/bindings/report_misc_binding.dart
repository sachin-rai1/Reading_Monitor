import 'package:get/get.dart';

import '../controllers/report_misc_controller.dart';

class ReportMiscBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportMiscController>(
      () => ReportMiscController(),
    );
  }
}
