import 'package:get/get.dart';

import '../controllers/flue_gas_controller.dart';

class FlueGasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlueGasController>(
      () => FlueGasController(),
    );
  }
}
