import 'package:get/get.dart';

import '../controllers/compare_flue_gas_controller.dart';

class CompareFlueGasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareFlueGasController>(
      () => CompareFlueGasController(),
    );
  }
}
