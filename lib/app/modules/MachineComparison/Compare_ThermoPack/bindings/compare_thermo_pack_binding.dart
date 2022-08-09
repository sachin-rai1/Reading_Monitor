import 'package:get/get.dart';

import '../controllers/compare_thermo_pack_controller.dart';

class CompareThermoPackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareThermoPackController>(
      () => CompareThermoPackController(),
    );
  }
}
