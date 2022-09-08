import 'package:get/get.dart';

import 'MachineListTabBarController.dart';


class MachineListTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MachineListTabBarController>(
          () => MachineListTabBarController(),
    );
  }
}
