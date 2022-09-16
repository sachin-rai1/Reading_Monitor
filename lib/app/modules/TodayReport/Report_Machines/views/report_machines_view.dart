import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/report_machines_controller.dart';

class ReportMachinesView extends GetView<ReportMachinesController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ReportMachinesController());
    final w = MediaQuery.of(context).size.width;
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
          Expanded(
              child: Scaffold(
            backgroundColor: Color(0xFFF1F1F1),
            body: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.machineList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: Colors.grey[200],
                        child: ExpansionTile(
                          trailing: Icon(Icons.arrow_drop_down_outlined,
                              color: Colors.red),
                          title: Column(children: [
                            Container(
                              height: 50,
                              alignment: Alignment.center,
                              width: w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.machineList[index].categories
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  // color: Color(0xFF716259),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: w / 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("EM",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15)),
                                            Text((controller.machineList[index].em != null)?
                                                controller
                                                    .machineList[index].em!
                                                    .toStringAsFixed(2) : "0",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: w / 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("HM",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            Text((controller.machineList[index].hm != null) ?
                                                controller
                                                    .machineList[index].hm!
                                                    .toStringAsFixed(2)
                                                    .toString() : "0",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: w / 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Water",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            Text(
                                                controller
                                                    .machineList[index].water
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: w / 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Batch",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            Text(
                                                controller
                                                    .machineList[index].batch
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      height: 90,
                                      child: VerticalDivider(
                                        thickness: 2,
                                        color: Colors.red,
                                      )),
                                  Column(
                                    children: [
                                      Container(
                                        width: w / 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Average",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            Obx(()=>
                                               Text((controller.machineList[index].average) != null?
                                                  controller
                                                      .machineList[index].average!
                                                      .toStringAsFixed(2)
                                                      .toString() : "0",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: w / 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Deviation",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            Text(
                                                controller
                                                    .machineList[index].dev
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: w / 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Water %",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            Text(
                                                controller
                                                    .machineList[index].weterper
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: w / 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("W/B",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            Text(
                                                controller.machineList[index]
                                                    .waterbatch
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.subMachineList.length,
                                  itemBuilder:
                                      (BuildContext context, int sIndex) {
                                    print("data are");
                                    print(controller
                                        .machineList[index].categories);
                                    print(controller
                                        .subMachineList[sIndex].categoryName);
                                    return (controller.machineList[index]
                                                .categories ==
                                            controller.subMachineList[sIndex]
                                                .categoryName)
                                        ? Card(
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  padding: EdgeInsets.only(
                                                      left: 15, right: 15),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Color(0xFF6EB7A1),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          controller
                                                              .subMachineList[
                                                                  sIndex]
                                                              .subCategoryName
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                  // color: Color(0xFF6EB7A1),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      top: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("EM : "),
                                                      Text(controller
                                                          .subMachineList[index]
                                                          .em!
                                                          .toStringAsFixed(2)
                                                          .toString()),
                                                      Text("Average : "),
                                                      Obx(()=>
                                                         Text((controller.subMachineList[index].average != null)
                                                             ?controller.subMachineList[index].average!.toStringAsFixed(2).toString() : "0"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      bottom: 10),
                                                  // decoration: BoxDecoration(
                                                  //   borderRadius: BorderRadius.circular(10) ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("HM : "),
                                                      Text(controller
                                                          .subMachineList[index]
                                                          .hm!
                                                          .toStringAsFixed(2)
                                                          .toString()),
                                                      Text("Deviation :"),
                                                      Text(controller
                                                          .subMachineList[index]
                                                          .dev!
                                                          .toStringAsFixed(2)
                                                          .toString()),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      bottom: 10),
                                                  // decoration: BoxDecoration(
                                                  //   borderRadius: BorderRadius.circular(10) ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Water : "),
                                                      Text(controller
                                                          .subMachineList[index]
                                                          .water!
                                                          .toStringAsFixed(2)
                                                          .toString()),
                                                      Text("Water % :"),
                                                      Obx(()=>
                                                         Text((controller.subMachineList[index].weterper != null)?controller.subMachineList[index].weterper!.toStringAsFixed(2).toString(): "0"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      bottom: 10),
                                                  // decoration: BoxDecoration(
                                                  //   borderRadius: BorderRadius.circular(10) ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Batch : "),
                                                      Text(controller
                                                          .subMachineList[index]
                                                          .batch!
                                                          .toString()),
                                                      Text("W/B :"),
                                                      Obx(()=>
                                                         Text((controller
                                                             .subMachineList[index]
                                                             .waterbatch != null)?controller
                                                            .subMachineList[index]
                                                            .waterbatch!
                                                            .toStringAsFixed(2)
                                                            .toString() : "0"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container();
                                  }),
                            ),
                          ],
                        ),
                      );
                    });
              }
            }),
          )),
        ],
      ),
    );
  }
}
