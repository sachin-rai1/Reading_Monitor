import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/report_thermo_pack_controller.dart';

class ReportThermoPackView extends GetView<ReportThermoPackController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ReportThermoPackController());
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
                              child: Obx(()=>
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
              Container(
                padding: const EdgeInsets.only(left: 32),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text("Chamber : "),
                        Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                            ),
                            height: 42,
                            width: w / 3,
                            child: const Text("10")),
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
                        const Text("IN Temperature:"),
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
                        const Text("Out Temperature  : "),
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
                        const Text("Coal 1 : "),
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
                        const Text("Coal 1 Deviation : "),
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
                        const Text("Coal 2 : "),
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
                        const Text("Coal 2 Deviation : "),
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
                        const Text("Delta T: "),
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
                        const Text("Delta T %: "),
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
                        const Text("Chamber Cost : "),
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
                        const Text("Chamber Cost % : "),
                        Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            height: 42,
                            width: w / 3,
                            child: const Text("")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
