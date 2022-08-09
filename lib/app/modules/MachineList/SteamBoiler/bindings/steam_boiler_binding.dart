import 'package:get/get.dart';

import '../controllers/steam_boiler_controller.dart';

class SteamBoilerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SteamBoilerController>(
      () => SteamBoilerController(),
    );
  }
}
