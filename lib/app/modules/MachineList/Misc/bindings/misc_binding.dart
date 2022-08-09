import 'package:get/get.dart';

import '../controllers/misc_controller.dart';

class MiscBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MiscController>(
      () => MiscController(),
    );
  }
}
