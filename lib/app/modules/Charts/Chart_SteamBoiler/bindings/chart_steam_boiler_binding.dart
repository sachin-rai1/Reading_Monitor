import 'package:get/get.dart';

import '../controllers/chart_steam_boiler_controller.dart';

class ChartSteamBoilerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartSteamBoilerController>(
      () => ChartSteamBoilerController(),
    );
  }
}
