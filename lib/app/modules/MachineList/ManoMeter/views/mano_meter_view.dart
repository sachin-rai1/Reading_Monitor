import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/views/machinelist_manometer_steamboiler_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/ManoMeter/views/machinelist_manometer_thermopack_view.dart';

import '../controllers/mano_meter_controller.dart';

class ManoMeterView extends GetView<ManoMeterController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ManoMeterController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 50),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: const Color(0xff6EB7A1),
                    bottom: TabBar(
                      indicatorColor: Colors.red,
                      tabs: const [
                        Tab(
                            child: Text('Steam Boiler',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white))),
                        Tab(
                            child: Text('Thermopack',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white))),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    MachinelistManometerSteamboilerView(),
                    MachinelistManometerThermopackView()
                    // ManoMeterSteamBoilerView(),
                    // ManoMeterThermoPackView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
