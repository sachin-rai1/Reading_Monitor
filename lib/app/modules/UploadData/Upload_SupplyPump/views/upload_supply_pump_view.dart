

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readingmonitor2/app/modules/MachineList/SupplyPump/controllers/supply_pump_controller.dart';
import '../../../../data/Constants.dart';
import '../controllers/upload_supply_pump_controller.dart';

class UploadSupplyPumpView extends GetView<UploadSupplyPumpController> {
  final supplyController = Get.put(SupplyPumpController());

  @override
  Widget build(BuildContext context) {
    Get.put(UploadSupplyPumpController());
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
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
              ],
            ),
            Container(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.data.length == 0) {
                      controller.addSupplyList();
                    } else {
                      controller.updateSupplyList();
                    }
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF6EB7A1),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 20),
        (controller.isLoading == true)
            ? SizedBox(
                height: 500,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Constants.primaryColor,
                  ),
                ),
              )
            : (controller.data.length == 0)
                ? Expanded(
                    flex: 2,
                    child: Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          print(" Null data   Hiiiiii");
                          print(controller.flow);
                          return ListView.builder(
                              itemCount: supplyController.supplyPumpList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: w / 4,
                                              child: Text(
                                                supplyController
                                                    .supplyPumpList[index].name
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blueAccent,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextFormField(
                                                decoration: InputDecoration(),
                                                controller:
                                                    controller.flow[index],
                                              ),
                                              height: 30,
                                              width: w / 4,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blueAccent,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextFormField(
                                                controller:
                                                    controller.unit[index],
                                              ),
                                              height: 30,
                                              width: w / 4,
                                            ),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  )
                : Expanded(
                    flex: 2,
                    child: Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          print("Hiiiiii");
                          print(controller.flow);
                          return ListView.builder(
                              itemCount: supplyController.supplyPumpList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: w / 4,
                                              child: Text(
                                                supplyController
                                                    .supplyPumpList[index].name
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blueAccent,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextFormField(
                                                decoration: InputDecoration(),
                                                controller:
                                                    controller.flow[index],
                                              ),
                                              height: 30,
                                              width: w / 4,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blueAccent,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextFormField(
                                                controller:
                                                    controller.unit[index],
                                              ),
                                              height: 30,
                                              width: w / 4,
                                            ),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  )
      ]),
    );
  }
}
