import 'package:get/get.dart';

import '../controllers/chart_flue_gas_controller.dart';

class ChartFlueGasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartFlueGasController>(
      () => ChartFlueGasController(),
    );
  }
}
