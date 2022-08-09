import 'package:get/get.dart';

import '../controllers/chart_water_quality_controller.dart';

class ChartWaterQualityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartWaterQualityController>(
      () => ChartWaterQualityController(),
    );
  }
}
