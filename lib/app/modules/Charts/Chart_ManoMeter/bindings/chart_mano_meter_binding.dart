import 'package:get/get.dart';

import '../controllers/chart_mano_meter_controller.dart';

class ChartManoMeterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartManoMeterController>(
      () => ChartManoMeterController(),
    );
  }
}
