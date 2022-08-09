import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/Charts/Chart_FlueGas/views/chart_flue_gas_view.dart';
import 'package:readingmonitor2/app/modules/Charts/Chart_GEB/views/chart_g_e_b_view.dart';
import 'package:readingmonitor2/app/modules/Charts/Chart_Machine/views/chart_machine_view.dart';
import 'package:readingmonitor2/app/modules/Charts/Chart_Misc/views/chart_misc_view.dart';
import 'package:readingmonitor2/app/modules/Charts/Chart_SteamBoiler/views/chart_steam_boiler_view.dart';
import 'package:readingmonitor2/app/modules/Charts/Chart_ThermoPack/views/chart_thermo_pack_view.dart';
import 'package:readingmonitor2/app/modules/Charts/Chart_Utility/views/chart_utility_view.dart';
import 'package:readingmonitor2/app/modules/Charts/Chart_WaterQuality/views/chart_water_quality_view.dart';

import '../../../Navigation/navigationDrawer.dart';
import '../home/views/home_view.dart';

class ChartNavigationBar extends StatelessWidget {
  const ChartNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Bg5.png'),
          fit: BoxFit.cover,
        ),
        //border:  Border.all(),
        //borderRadius: BorderRadius.circular(20)
      )),
      child: DefaultTabController(
        length: 10,
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
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                    child: Text('Utility',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
                Tab(
                    child: Text('Steam Boiler',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
                Tab(
                    child: Text('Thermopack',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
                Tab(
                    child: Text('Machines',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
                Tab(
                    child: Text('WaterQuality',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
                Tab(
                    child: Text('SupplyPump',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
                Tab(
                    child: Text('GEB',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
                Tab(
                    child: Text('ManoMeter',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
                Tab(
                    child: Text('FlueGas',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),
                Tab(
                    child: Text('Misc.',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF6EB7A1)))),

              ],
            ),
          ),
          body: TabBarView(
            children: [
              ChartUtilityView(),
              ChartSteamBoilerView(),
              ChartThermoPackView(),
              ChartMachineView(),
              ChartWaterQualityView(),
              ChartSteamBoilerView(),
              ChartGEBView(),
              ChartMachineView(),
              ChartFlueGasView(),
              ChartMiscView()

            ],
          ),
        ),
      ),
    );
  }
}

