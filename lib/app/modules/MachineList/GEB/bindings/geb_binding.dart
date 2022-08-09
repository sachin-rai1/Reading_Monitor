import 'package:get/get.dart';

import '../controllers/geb_controller.dart';

class GebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GebController>(
      () => GebController(),
    );
  }
}
