import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/controllers/flue_gas_controller_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/views/dialogview_view.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/views/machinelist_flue_gas_thermopack_view.dart';



class FlueGasView extends GetView<FlueGasControllerController> {
  @override
  Widget build(BuildContext context) {
    Get.put(FlueGasControllerController());
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
                    DialogviewView(),
                    MachinelistFlueGasThermopackView()

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
