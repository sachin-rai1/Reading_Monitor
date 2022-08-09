import 'package:get/get.dart';

class ManoMeterController extends GetxController {
  //TODO: Implement ManoMeterController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
