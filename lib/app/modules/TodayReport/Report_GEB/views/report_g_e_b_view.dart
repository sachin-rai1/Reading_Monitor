import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../home/controllers/home_controller.dart';
import '../controllers/report_g_e_b_controller.dart';

class ReportGEBView extends GetView<ReportGEBController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    HomeController homeController = Get.find();
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
                        homeController.chooseDate();
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_sharp,
                            color: Color(0xFF6EB7A1),
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                DateFormat("dd-MM-yyyy")
                                    .format(homeController.selectedDate.value)
                                    .toString(),
                                style: const TextStyle(
                                  color: Color(0xFF848484),
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
                            child: const Text("")),
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
                            child: const Text("")),
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
                            child: const Text("")),
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
                            child: const Text("")),
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
                            child: const Text("")),
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
                            child: const Text("")),
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
                            child: const Text("")),
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
                            child: const Text("30")),
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
                            child: const Text("")),
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
                            child: const Text("")),
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
                            child: const Text("25")),
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
                            child: const Text("5")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );

  }
}
