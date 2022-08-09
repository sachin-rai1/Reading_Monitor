import 'package:get/get.dart';

import '../controllers/report_water_quality_controller.dart';

class ReportWaterQualityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportWaterQualityController>(
      () => ReportWaterQualityController(),
    );
  }
}
