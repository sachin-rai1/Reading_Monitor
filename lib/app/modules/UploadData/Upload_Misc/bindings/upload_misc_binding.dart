import 'package:get/get.dart';

import '../controllers/upload_misc_controller.dart';

class UploadMiscBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      UploadMiscController(),
    );
  }
}
