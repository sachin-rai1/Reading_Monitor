import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/GEB/views/geb_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/Machine/views/machine_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/views/mano_meter_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/Misc/views/misc_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/SteamBoiler/views/steam_boiler_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/SupplyPump/views/supply_pump_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/ThermoPack/views/thermo_pack_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/views/utility_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/flueGas/views/flue_gas_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/waterQuality/views/water_quality_view.dart';
import '../../../../Navigation/navigationDrawer.dart';
import '../../home/views/home_view.dart';
import 'MachineListTabBarController.dart';

class MachineListTabBar extends GetView {
  @override
  Widget build(BuildContext context) {
    final MachineListTabBarController tabx =
        Get.put(MachineListTabBarController());
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
              UtilityView(),
              SteamBoilerView(),
              ThermoPackView(),
              MachineView(),
              WaterQualityView(),
              SupplyPumpView(),
              GebView(),
              ManoMeterView(),
              FlueGasView(),
              MiscView()
            ],
          ),
        ),

    );
  }
}
