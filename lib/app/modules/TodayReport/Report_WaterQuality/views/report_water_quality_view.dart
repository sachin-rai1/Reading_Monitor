import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/report_water_quality_controller.dart';

class ReportWaterQualityView extends GetView<ReportWaterQualityController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ReportWaterQualityController());
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
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
          Expanded(child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else
              if (controller.machineList.isEmpty) {
              return ClipRRect(
                child: Image.asset(
                  'assets/images/ak.png',
                  alignment: Alignment.center,
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: controller.machineList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.machineList[index].machineName
                                        .toString()
                                        .toUpperCase(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            // Divider(thickness: 1,color: Colors.black,),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, top: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: w / 3,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("TDS"),
                                            Text(controller
                                                .machineList[index].tds!
                                                .toStringAsFixed(2)
                                                .toString()),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("TDS %"),
                                            Text(controller.machineList[index]
                                                .tdsPercentage!
                                                .toStringAsFixed(2)
                                                .toString()),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("PH"),
                                            Text(controller
                                                .machineList[index].ph!
                                                .toStringAsFixed(2)
                                                .toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: h / 15,
                                    child: VerticalDivider(
                                      color: Colors.black12,
                                      thickness: 2,
                                    ),
                                  ),
                                  Container(
                                    width: w / 3,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("PH % : "),
                                            Text(controller.machineList[index]
                                                .phPercentage!
                                                .toStringAsFixed(2)
                                                .toString()),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Hardness : "),
                                            Text(controller
                                                .machineList[index].hardness!
                                                .toStringAsFixed(2)
                                                .toString()),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Hardness % : "),
                                            Text(controller.machineList[index]
                                                .hardnessPercentage!
                                                .toStringAsFixed(2)
                                                .toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }))
        ],
      ),
    );
  }
}
