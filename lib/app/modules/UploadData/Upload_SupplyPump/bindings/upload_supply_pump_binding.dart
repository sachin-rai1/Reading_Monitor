import 'package:get/get.dart';

import '../controllers/upload_supply_pump_controller.dart';

class UploadSupplyPumpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadSupplyPumpController>(
      () => UploadSupplyPumpController(),
    );
  }
}
