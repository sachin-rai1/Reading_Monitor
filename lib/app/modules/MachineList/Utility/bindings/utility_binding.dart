import 'package:get/get.dart';

import '../controllers/utility_controller.dart';

class UtilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UtilityController(),
    );
  }
}
