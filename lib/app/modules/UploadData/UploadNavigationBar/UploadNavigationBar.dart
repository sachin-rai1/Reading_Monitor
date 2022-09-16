import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/Navigation/navigationDrawer.dart';
import 'package:readingmonitor2/app/modules/UploadData/UploadNavigationBar/UploadNavigationController.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_FlueGas/views/upload_flue_gas_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_GEB/views/upload_g_e_b_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_Machine/views/upload_machine_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_ManoMeter/views/upload_mano_meter_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_Misc/views/upload_misc_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_SteamBoiler/views/upload_steam_boiler_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_SupplyPump/views/upload_supply_pump_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_ThermoPack/views/upload_thermo_pack_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_Utility/views/upload_utility_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_WaterQuality/views/upload_water_quality_view.dart';
import 'package:readingmonitor2/app/modules/home/views/home_view.dart';

class UploadNavigationBar extends GetView<UploadTabBarController> {
  @override
  Widget build(BuildContext context) {
    final UploadTabBarController tabx = Get.put(UploadTabBarController());
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
            UploadUtilityView(),
            UploadSteamBoilerView(),
            UploadThermoPackView(),
            UploadMachineView(),
            UploadWaterQualityView(),
            UploadSupplyPumpView(),
            UploadGEBView(),
            UploadManoMeterView(),
            UploadFlueGasView(),
            UploadMiscView()
          ],
        ),
      ),
    );
  }
}
