import 'package:get/get.dart';

import '../controllers/chart_misc_controller.dart';

class ChartMiscBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartMiscController>(
      () => ChartMiscController(),
    );
  }
}
