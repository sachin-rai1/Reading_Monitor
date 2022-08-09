import 'package:get/get.dart';

import '../controllers/compare_steam_boiler_controller.dart';

class CompareSteamBoilerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareSteamBoilerController>(
      () => CompareSteamBoilerController(),
    );
  }
}
