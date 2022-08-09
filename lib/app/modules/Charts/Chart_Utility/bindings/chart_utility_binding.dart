import 'package:get/get.dart';

import '../controllers/chart_utility_controller.dart';

class ChartUtilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartUtilityController>(
      () => ChartUtilityController(),
    );
  }
}
