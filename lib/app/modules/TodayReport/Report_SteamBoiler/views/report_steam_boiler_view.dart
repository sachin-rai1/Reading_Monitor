import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/report_steam_boiler_controller.dart';

class ReportSteamBoilerView extends GetView<ReportSteamBoilerController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ReportSteamBoilerController());
    final w = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
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
                            child: Obx(
                              () => Text(
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
                  padding: const EdgeInsets.only(right: 8.0),
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
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: controller.machineList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text("BFW : "),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child: Text(controller
                                              .machineList[index].bfwone!.toStringAsFixed(2)
                                              .toString())),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("BFW Temperature : "),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child: Text(controller
                                              .machineList[index]
                                              .bfwTemperatureUpload!.toStringAsFixed(2)
                                              .toString())),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text("BFW % :"),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child: Text(controller
                                              .machineList[index]
                                              .bfwonePercentage!.toStringAsFixed(2)
                                              .toString())),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("BFW Temperature % : "),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child:
                                          Text(controller
                                              .machineList[index]
                                              .bfwtemperaturepercentage!.toStringAsFixed(2)
                                              .toString())),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text("Coal 1 : "),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child: Text(controller
                                              .machineList[index].coal1!.toStringAsFixed(2)
                                              .toString())),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("Coal 1 Deviation : "),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child: Text(controller
                                              .machineList[index]
                                              .coal1Percentage!.toStringAsFixed(2)
                                              .toString())),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text("Coal 2 : "),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child: Text(controller
                                              .machineList[index].coal2!.toStringAsFixed(2)
                                              .toString()))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("Coal 2 Deviation : "),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child: Text(controller
                                              .machineList[index]
                                              .coal2Percentage!.toStringAsFixed(2)
                                              .toString())),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text("Steam Cost : "),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child: Text(controller
                                              .machineList[index].sc!.toStringAsFixed(2)
                                              .toString())),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("Steam Cost % : "),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          height: 42,
                                          width: w / 3,
                                          child: Text(controller
                                              .machineList[index].scPercentage!.toStringAsFixed(2)
                                              .toString())),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                }
              }),
            ),
          ],
        ));
  }
}
