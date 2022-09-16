import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/ReportNavigation/controllers/report_tab_bar_controller.dart';

class ReportNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportTabBarController>(
          () => ReportTabBarController(),
    );
  }
}
