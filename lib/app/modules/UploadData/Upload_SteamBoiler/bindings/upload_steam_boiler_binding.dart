import 'package:get/get.dart';

import '../controllers/upload_steam_boiler_controller.dart';

class UploadSteamBoilerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadSteamBoilerController>(
      () => UploadSteamBoilerController(),
    );
  }
}
