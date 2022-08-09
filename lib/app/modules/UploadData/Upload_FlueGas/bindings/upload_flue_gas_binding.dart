import 'package:get/get.dart';

import '../controllers/upload_flue_gas_controller.dart';

class UploadFlueGasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadFlueGasController>(
      () => UploadFlueGasController(),
    );
  }
}
