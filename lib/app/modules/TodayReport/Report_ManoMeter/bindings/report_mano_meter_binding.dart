import 'package:get/get.dart';

import '../controllers/report_mano_meter_controller.dart';

class ReportManoMeterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportManoMeterController>(
      () => ReportManoMeterController(),
    );
  }
}
