import 'package:get/get.dart';

import '../controllers/upload_utility_controller.dart';

class UploadUtilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadUtilityController>(
      () => UploadUtilityController(),
    );
  }
}
