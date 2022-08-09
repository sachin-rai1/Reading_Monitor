import 'package:get/get.dart';

import '../controllers/chart_thermo_pack_controller.dart';

class ChartThermoPackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartThermoPackController>(
      () => ChartThermoPackController(),
    );
  }
}
