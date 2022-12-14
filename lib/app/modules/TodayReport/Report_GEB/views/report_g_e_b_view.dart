import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/report_g_e_b_controller.dart';

class ReportGEBView extends GetView<ReportGEBController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ReportGEBController());
    final w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
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
              RefreshIndicator(
                  onRefresh: (){
                    return Future(() => controller.fetchGebList());
                  },
                child:
                   SingleChildScrollView(
                     child: Form(
                       child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text("KWH : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text(
                                              (controller.machineList.isNotEmpty && controller.machineList[0].kwh!=null)
                                              ? controller.machineList[0].kwh.toString()
                                              : "0"
                                          ),
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("KWH Deviation : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].kwhtotalper!=null)
                                              ? controller.machineList[0].kwhtotalper!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text("PF :"),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].pf!=null)
                                              ? controller.machineList[0].pf!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("PF Deviation : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].pfper!=null)
                                              ? controller.machineList[0].pfper!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text("KVARH : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].kvarh!=null)
                                              ? controller.machineList[0].kvarh!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("KVARH Deviation : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].kvarhper!=null)
                                              ? controller.machineList[0].kvarhper!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text("MD : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(() => Text(
                                            (controller.machineList.isNotEmpty && controller.machineList[0].md !=  null)
                                                ? controller.machineList[0].md.toString()
                                                : "0"))),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("MD Deviation : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].mdper!=null)
                                              ? controller.machineList[0].mdper!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text("KVAH : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].kevah!=null)
                                              ? controller.machineList[0].kevah!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("KVAH Deviation : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].kvahper != null)
                                              ? controller.machineList[0].kvahper!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text("Turbine : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].turbine != null)
                                              ? controller.machineList[0].turbine!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Turbine Deviation : "),
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        height: 42,
                                        width: w / 3,
                                        child: Obx(
                                          () => Text((controller.machineList.isNotEmpty && controller.machineList[0].turbineper != null)
                                              ? controller.machineList[0].turbineper!
                                                  .toStringAsFixed(2)
                                                  .toString()
                                              : "0"),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                  ),
                     ),
                   ),
                ),

            ],
          )),
    );
  }
}
