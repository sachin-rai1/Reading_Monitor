import 'package:get/get.dart';

import '../controllers/upload_mano_meter_controller.dart';

class UploadManoMeterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadManoMeterController>(
      () => UploadManoMeterController(),
    );
  }
}
