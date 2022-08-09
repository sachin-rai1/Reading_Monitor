import 'package:get/get.dart';

import '../controllers/compare_water_quality_controller.dart';

class CompareWaterQualityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareWaterQualityController>(
      () => CompareWaterQualityController(),
    );
  }
}
