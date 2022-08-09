import 'package:get/get.dart';

import '../controllers/thermo_pack_controller.dart';

class ThermoPackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThermoPackController>(
      () => ThermoPackController(),
    );
  }
}
