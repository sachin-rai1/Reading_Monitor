import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_FlueGas/views/compare_flue_gas_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_GEB/views/compare_g_e_b_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_Machine/views/compare_machine_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_ManoMeter/views/compare_mano_meter_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_Misc/views/compare_misc_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_SteamBoiler/views/compare_steam_boiler_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_SupplyPump/views/compare_supply_pump_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_ThermoPack/views/compare_thermo_pack_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_Utility/views/compare_utility_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/Compare_WaterQuality/views/compare_water_quality_view.dart';
import 'package:readingmonitor2/app/modules/MachineComparison/NavigationCompare/CompareNavigationBarController.dart';

import '../../../../Navigation/navigationDrawer.dart';
import '../../home/views/home_view.dart';

class CompareNavigationBar extends GetView<CompareTabBarController> {
  @override
  Widget build(BuildContext context) {
    final CompareTabBarController tabx = Get.put(CompareTabBarController());
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
            CompareUtilityView(),
            CompareSteamBoilerView(),
            CompareThermoPackView(),
            CompareMachineView(),
            CompareWaterQualityView(),
            CompareSupplyPumpView(),
            CompareGEBView(),
            CompareManoMeterView(),
            CompareFlueGasView(),
            CompareMiscView()
          ],
        ),
      ),
    );
  }
}
