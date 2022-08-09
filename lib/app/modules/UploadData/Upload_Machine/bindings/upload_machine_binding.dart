import 'package:get/get.dart';

import '../controllers/upload_machine_controller.dart';

class UploadMachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadMachineController>(
      () => UploadMachineController(),
    );
  }
}
