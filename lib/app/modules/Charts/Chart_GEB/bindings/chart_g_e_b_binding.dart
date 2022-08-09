import 'package:get/get.dart';

import '../controllers/chart_g_e_b_controller.dart';

class ChartGEBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartGEBController>(
      () => ChartGEBController(),
    );
  }
}
