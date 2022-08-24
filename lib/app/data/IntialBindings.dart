import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/SteamBoiler/controllers/steam_boiler_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/utility_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtilityController>(() => UtilityController());
    Get.lazyPut<SteamBoilerController>(() => SteamBoilerController());
  }
}
