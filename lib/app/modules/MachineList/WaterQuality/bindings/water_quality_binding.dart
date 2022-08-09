import 'package:get/get.dart';

import '../controllers/water_quality_controller.dart';

class WaterQualityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterQualityController>(
      () => WaterQualityController(),
    );
  }
}
