import 'package:get/get.dart';

import '../controllers/report_steam_boiler_controller.dart';

class ReportSteamBoilerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportSteamBoilerController>(
      () => ReportSteamBoilerController(),
    );
  }
}
