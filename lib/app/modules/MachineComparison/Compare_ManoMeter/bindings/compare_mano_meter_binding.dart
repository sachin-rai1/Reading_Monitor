import 'package:get/get.dart';

import '../controllers/compare_mano_meter_controller.dart';

class CompareManoMeterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareManoMeterController>(
      () => CompareManoMeterController(),
    );
  }
}
