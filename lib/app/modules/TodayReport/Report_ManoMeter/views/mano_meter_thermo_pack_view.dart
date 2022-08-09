import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ManoMeterThermoPackView extends GetView {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
        width: w,
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    height: h / 35,
                    alignment: Alignment.center,
                    width: w / 3.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB9B9B9),
                      ),
                      color: const Color(0xFFF1F1F1),
                    ),
                    child: const Text("ID FAN Hz")),
                Container(
                    height: h / 35,
                    alignment: Alignment.center,
                    width: w / 3.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB9B9B9),
                      ),
                      color: const Color(0xFFF1F1F1),
                    ),
                    child: const Text("FD FAN Hz")),
                Container(
                    height: h / 35,
                    alignment: Alignment.center,
                    width: w / 3.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB9B9B9),
                      ),
                      color: const Color(0xFFF1F1F1),
                    ),
                    child: const Text("Coal Used")),
              ],
            ),
            Row(
              children: [
                Container(
                    height: h / 35,
                    alignment: Alignment.center,
                    width: w / 3.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB9B9B9),
                      ),
                      color: const Color(0xFFF1F1F1),
                    ),
                    child: const Text("41 Hz")),
                Container(
                    height: h / 35,
                    alignment: Alignment.center,
                    width: w / 3.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB9B9B9),
                      ),
                      color: const Color(0xFFF1F1F1),
                    ),
                    child: const Text("24 Hz")),
                Container(
                    height: h / 35,
                    alignment: Alignment.center,
                    width: w / 3.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB9B9B9),
                      ),
                      color: const Color(0xFFF1F1F1),
                    ),
                    child: const Text("4000 GAR")),
              ],
            ),
            Row(
              children: [
                Container(
                    height: h / 35,
                    alignment: Alignment.center,
                    width: w / 2.62,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB9B9B9),
                      ),
                      color: const Color(0xFFF1F1F1),
                    ),
                    child: const Text("APH To Furnace ")),
                Container(
                    height: h / 35,
                    alignment: Alignment.center,
                    width: w / 3.6,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB9B9B9),
                      ),
                      color: const Color(0xFFF1F1F1),
                    ),
                    child: const Text("35")),
                Container(
                    height: h / 35,
                    alignment: Alignment.center,
                    width: w / 3.6,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB9B9B9),
                      ),
                      color: const Color(0xFFF1F1F1),
                    ),
                    child: const Text("65 \u00B0 C")),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SizedBox(
                            height: 20,
                            child: DottedLine(
                              lineThickness: 2,
                              direction: Axis.vertical,
                              dashColor: Colors.red,
                            )
                        ),
                      ],
                    );
                  },
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10.0,right: 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: h / 25,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFFF1F1F1),
                              ),
                              child: Text("Machine ${index + 1}"),
                            ),
                            Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        height: 20,
                                        child: const DottedLine(
                                          lineThickness: 2,
                                          direction: Axis.vertical,
                                          dashColor: Colors.red,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        height: h / 30,
                                        alignment: Alignment.center,
                                        width:
                                        MediaQuery.of(context).size.width /
                                            5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFF00D563),
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: const Color(0xFFF1F1F1),
                                        ),
                                        child: const Text("67.67")),

                                    DottedLine(
                                      dashColor: Colors.red,
                                      lineLength: w/2,
                                      lineThickness: 2,
                                    ),

                                    Container(
                                      height: h / 30,
                                      alignment: Alignment.center,
                                      width:
                                      MediaQuery.of(context).size.width / 5,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF00D563),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFF1F1F1),
                                      ),
                                      child: const Text("1234"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ));
  }
}
