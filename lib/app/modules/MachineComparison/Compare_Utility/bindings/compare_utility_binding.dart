import 'package:get/get.dart';

import '../controllers/compare_utility_controller.dart';

class CompareUtilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareUtilityController>(
      () => CompareUtilityController(),
    );
  }
}
