import 'package:get/get.dart';

import '../controllers/upload_water_quality_controller.dart';

class UploadWaterQualityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadWaterQualityController>(
      () => UploadWaterQualityController(),
    );
  }
}
