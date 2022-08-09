import 'package:get/get.dart';

import '../controllers/mano_meter_controller.dart';

class ManoMeterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManoMeterController>(
      () => ManoMeterController(),
    );
  }
}
