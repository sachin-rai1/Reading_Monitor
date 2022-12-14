import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readingmonitor2/app/modules/Charts/ChartNavigationBar.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/NavigationCompare/CompareNavigationBar.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/sub_utility_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/utility_controller.dart';
import 'package:readingmonitor2/app/modules/TodayReport/ReportNavigation/views/report_navigation_bar_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Utilty/controllers/report_utilty_controller.dart';
import 'package:readingmonitor2/app/modules/UploadData/UploadNavigationBar/UploadNavigationBar.dart';
import '../app/modules/MachineList/MachineListTabBarNaviagtion/MachineListTabBar.dart';
import '../app/routes/app_pages.dart';
import 'createDrawerBodyItem.dart';
import 'createDrawerHeader.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return SafeArea(
      child: GestureDetector(
        child: Drawer(
            backgroundColor: const Color(0xFF6EB7A1),
            child: SingleChildScrollView(
              child: Column(
                //padding: EdgeInsets.zero,
                children: <Widget>[
                  createDrawerHeader(),
                  createDrawerBodyItem(
                      icon: Icons.list_alt,
                      text: "Today's Report",
                      onTap: () {
                        // Text("Hii");
                        Get.lazyPut(()=>SubUtilityController());
                        Get.back();
                         Get.to(() => ReportNavigationBarView());
                      }),
                  createDrawerBodyItem(
                      icon: Icons.calendar_month_outlined,
                      text: (formattedDate),
                      onTap: () {}),
                  createDrawerBodyItem(
                      icon: Icons.upload, text: 'Upload Report', onTap: () {
                    Get.back();
                    Get.to(() => UploadNavigationBar());
                  }),
                  createDrawerBodyItem(
                      icon: Icons.auto_awesome_mosaic,
                      text: 'Machine Comparison',
                      onTap: () {
                        Get.back();
                        Get.to(() => CompareNavigationBar());
                      }),
                  createDrawerBodyItem(
                      icon: Icons.bar_chart, text: 'Charts', onTap: () {
                    Get.back();
                    Get.to(() => ChartNavigationBar());
                  }),
                  createDrawerBodyItem(
                      icon: Icons.list_alt_outlined,
                      text: 'Machine List',
                      onTap: () {
                        // Get.delete<UtilityController>();
                        // Get.delete<SubUtilityController>();
                        Get.back();
                         Get.to(() => MachineListTabBar());
                      }
                  ),
                  createDrawerBodyItem(
                      icon: Icons.person, text: 'ManageUsers', onTap: () {}),
                  createDrawerBodyItem(
                      icon: Icons.speed_sharp,
                      text: 'Master Reading',
                      onTap: () {}),
                  createDrawerBodyItem(
                      icon: Icons.format_list_numbered,
                      text: 'To Do List',
                      onTap: () {}),
                  createDrawerBodyItem(
                      icon: Icons.account_circle_outlined,
                      text: 'Profile',
                      onTap: () {}),
                ],
              ),
            )),
      ),
    );
  }
}
