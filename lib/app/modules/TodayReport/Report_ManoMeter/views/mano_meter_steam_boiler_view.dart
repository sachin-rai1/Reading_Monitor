import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ManoMeterSteamBoilerView extends GetView {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    List machines = [
      "hello",
      "hello",
      "hello",
      "hello",
      "hello",
      "hello",
      "hello",
      "hello",
      "hello",
    ];

    return Container(
      width: w,
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: h/35,
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
                  height: h/35,
                  alignment: Alignment.center,
                  width: w / 3.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFB9B9B9),),
                    color: const Color(0xFFF1F1F1),
                  ),
                  child: const Text("FD FAN Hz")),
              Container(
                  height: h/35,
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
                  height: h/35,
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
                  height: h/35,
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
                  height: h/35,
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
                  height: h/35,
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
                  height: h/35,
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
                  height: h/35,
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
            child: ListView.builder(
                itemCount: machines.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.only(top : 10.0, left: 5),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: h / 25,
                            width: MediaQuery.of(context).size.width /4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFF1F1F1),
                            ),
                            child: Text("Machine ${index + 1}"),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: h / 30,
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width / 5,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF00D563),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFF1F1F1),
                                      ),
                                      child: const Text("67.67")),
                                  SizedBox(width: w/1.9),
                                  Container(
                                    height: h / 30,
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width / 5,
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
                }),
          ),
        ],
      ),
    );
  }
}
