import 'package:get/get.dart';

import '../controllers/compare_misc_controller.dart';

class CompareMiscBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareMiscController>(
      () => CompareMiscController(),
    );
  }
}
