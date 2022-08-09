import 'package:get/get.dart';

import '../controllers/upload_thermo_pack_controller.dart';

class UploadThermoPackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadThermoPackController>(
      () => UploadThermoPackController(),
    );
  }
}
