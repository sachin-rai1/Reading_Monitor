import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_ManoMeter/views/mano_meter_steam_boiler_view.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_ManoMeter/views/mano_meter_thermo_pack_view.dart';

import '../../../home/controllers/home_controller.dart';
import '../controllers/report_mano_meter_controller.dart';

class ReportManoMeterView extends GetView<ReportManoMeterController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ReportManoMeterController());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  controller.chooseDate();
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_sharp,
                      color: Color(0xFF6EB7A1),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Obx(() =>
                          Text(
                            DateFormat("dd-MM-yyyy")
                                .format(controller.selectedDate.value)
                                .toString(),
                            style: const TextStyle(
                              color: Color(0xFF848484),
                            ),
                          ),
                        )),
                    const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Color(0xFF6EB7A1),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFE1DFDD),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'SMS',
                    style: TextStyle(
                      color: Color(0xFF848484),
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFE1DFDD),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'E-Mail',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF848484),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar:
              PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 50),
                child:
                Container(
                  padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width /3 , left: 8),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor:const Color(0xFF6EB7A1),
                    bottom: TabBar(
                      indicatorColor: Colors.red,
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.scrolledUnder)) {
                            return const Color(0xFF6EB7A1);
                          }
                          return Colors.white;
                        },
                      ),
                      tabs: const [
                        Tab(
                            child: Text('Steam Boiler',
                                style: TextStyle(fontSize: 16, color: Colors.white))),
                        Tab(
                            child: Text('Thermopack',
                                style: TextStyle(fontSize: 16, color: Colors.white))),
                      ],
                    ),
                  ),
                ),
              ),
              body:   TabBarView(children: [
                ManoMeterSteamBoilerView(),
                ManoMeterThermoPackView(),
              ],

              ),
            ),
          ),
        ),
      ],
    );
  }
}
