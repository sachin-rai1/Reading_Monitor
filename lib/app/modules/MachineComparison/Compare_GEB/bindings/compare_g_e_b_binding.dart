import 'package:get/get.dart';

import '../controllers/compare_g_e_b_controller.dart';

class CompareGEBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareGEBController>(
      () => CompareGEBController(),
    );
  }
}
