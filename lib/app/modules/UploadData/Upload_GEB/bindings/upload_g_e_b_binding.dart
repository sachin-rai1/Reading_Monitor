import 'package:get/get.dart';

import '../controllers/upload_g_e_b_controller.dart';

class UploadGEBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadGEBController>(
      () => UploadGEBController(),
    );
  }
}
