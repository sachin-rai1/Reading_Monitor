import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/UploadData/UploadNavigationBar/UploadNavigationBar.dart';




class UploadNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadNavigationBar>(
          () => UploadNavigationBar(),
    );
  }
}
