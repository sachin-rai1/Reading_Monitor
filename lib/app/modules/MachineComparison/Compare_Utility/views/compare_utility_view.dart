import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../home/controllers/home_controller.dart';
import '../controllers/compare_utility_controller.dart';

class CompareUtilityView extends GetView<CompareUtilityController> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(DateTime(2015, 2, 1), 621, 522, 300),
      ChartData(DateTime(2015, 2, 2), 534, 235, 300),
      ChartData(DateTime(2015, 2, 3), 320, 140, 300),
      ChartData(DateTime(2015, 2, 4), 142, 450, 300),
      ChartData(DateTime(2015, 2, 5), 335, 260, 300),
      ChartData(DateTime(2015, 2, 6), 235, 360, 300),
      ChartData(DateTime(2015, 2, 7), 135, 160, 300),
      ChartData(DateTime(2015, 2, 8), 325, 360, 300),
      ChartData(DateTime(2015, 2, 9), 350, 260, 300),
      ChartData(DateTime(2015, 2, 10), 389, 160 , 350),
    ];
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    Get.put(HomeController());
    HomeController homeController = Get.find();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
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
              Row(
                children: [
                  Container(
                    height: 25,
                    decoration: const BoxDecoration(
                      color: Color(0xFF6EB7A1),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'GO',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Color(0xFF6EB7A1),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: h / 2.5,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color(0xFFB9B9B9),
                    )),
                child: Expanded(
                  child: ListView.builder(
                    // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 14,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Machine',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 25,
                              width: w,
                              child: ListView.builder(
                                  itemCount: 8,
                                  scrollDirection: Axis.horizontal,
                                  // physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        const Text(
                                          'Sub',
                                          style: TextStyle(fontSize: 12.0),
                                        ), //Text
                                        Checkbox(
                                          // value: value,
                                          // onChanged: (value) {
                                          //     this.value = value!;
                                          value:  value , onChanged: (value) {this.value = value!; },

                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color(0xFFB9B9B9),
                            ),
                          ],
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF6EB7A1),
                    ),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Preview',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    borderColor: const Color(0xFFB9B9B9),

                    series: <ChartSeries<ChartData, DateTime>>[
                      // Renders Column chart
                      ColumnSeries<ChartData, DateTime>(
                          color: const Color(0xFF2F1112),
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      ColumnSeries<ChartData, DateTime>(
                          color: const Color(0xFFFF1616),
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y1),
                    ]),
              ),
              // Container(
              //     decoration: BoxDecoration(
              //         border: Border.all(
              //           width: 2,
              //           color: const Color(0xFFB9B9B9),
              //         ),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: const MachineDataTable()),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1 , this.y2);

  final DateTime x;
  final double y;
  final double y1;
  final double y2;
}
