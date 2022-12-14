import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/ReportNavigation/controllers/report_tab_bar_controller.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_FlueGas/views/report_flue_gas_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_GEB/views/report_g_e_b_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Machines/views/report_machines_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_ManoMeter/views/report_mano_meter_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Misc/views/report_misc_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_SteamBoiler/views/report_steam_boiler_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_SupplyPump/views/report_supply_pump_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_ThermoPack/views/report_thermo_pack_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Utilty/views/report_utilty_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_WaterQuality/views/report_water_quality_view.dart';

import '../../../../../Navigation/navigationDrawer.dart';
import '../../../home/views/home_view.dart';

class ReportNavigationBarView extends GetView<ReportTabBarController> {
  @override
  Widget build(BuildContext context) {
    final ReportTabBarController tabx = Get.put(ReportTabBarController());
    return Container(
      decoration: (const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Bg5.png'),
          fit: BoxFit.cover,
        ),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: GestureDetector(
            onTap: () {
              Get.to(HomeView());
            },
            child: ClipRRect(
              child: Image.asset(
                'assets/images/RmLogo.png',
                height: 33,
                width: 124,
              ),
            ),
          ),
          leading: Builder(builder: (context) {
            return IconButton(
              iconSize: 41.19,
              icon: const Icon(Icons.menu),
              color: Colors.green,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }),
          bottom: TabBar(
            controller: tabx.controller,
            indicatorColor: Colors.brown,
            isScrollable: true,
            tabs: tabx.myTabs,
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: tabx.controller,
          children: [
            ReportUtiltyView(),
            ReportSteamBoilerView(),
            ReportThermoPackView(),
            ReportMachinesView(),
            ReportWaterQualityView(),
            ReportSupplyPumpView(),
            ReportGEBView(),
            ReportManoMeterView(),
            ReportFlueGasView(),
            ReportMiscView()
          ],
        ),
      ),
    );
  }
}
