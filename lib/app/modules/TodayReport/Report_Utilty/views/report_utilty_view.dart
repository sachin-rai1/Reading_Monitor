import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/report_utilty_controller.dart';

class ReportUtiltyView extends GetView<ReportUtiltyController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ReportUtiltyController());
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
          Obx(
            () => (controller.utilityList.isNotEmpty)
                ? Expanded(
                    child: Scaffold(
                    backgroundColor: Color(0xFFF1F1F1),
                    body: Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.utilityList.length,
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
                                            controller.utilityList[index]
                                                .uitilityCategories
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                                // fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.brown[500]
                                                // color: Colors.white
                                                ),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("EM",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15)),
                                                    Text(
                                                        controller
                                                            .utilityList[index]
                                                            .em!
                                                            .toStringAsFixed(2)
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black)),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("HM",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                        )),
                                                    Text(
                                                        controller
                                                            .utilityList[index]
                                                            .hm!
                                                            .toStringAsFixed(2)
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                              height: 40,
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Average",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black)),
                                                    Text(
                                                        controller
                                                            .utilityList[index]
                                                            .average
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black)),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Deviation",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black)),
                                                    Text(
                                                        controller
                                                            .utilityList[index]
                                                            .dev
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black)),
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              controller.subUtilityList.length,
                                          itemBuilder: (BuildContext context,
                                              int sIndex) {
                                            print("data are");
                                            print(controller.utilityList[index]
                                                .uitilityCategories);
                                            print(controller
                                                .subUtilityList[sIndex]
                                                .categoryName);
                                            return (controller
                                                        .utilityList[index]
                                                        .uitilityCategories ==
                                                    controller
                                                        .subUtilityList[sIndex]
                                                        .categoryName)
                                                ? Card(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 30,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Color(
                                                                0xFF6EB7A1),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  controller
                                                                      .subUtilityList[
                                                                          sIndex]
                                                                      .subCategoryName
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          ),
                                                          // color: Color(0xFF6EB7A1),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text("EM : "),
                                                              Text(controller
                                                                  .subUtilityList[
                                                                      index]
                                                                  .em!
                                                                  .toStringAsFixed(
                                                                      2)
                                                                  .toString()),
                                                              Text(
                                                                  "Average : "),
                                                              Text(controller
                                                                  .subUtilityList[
                                                                      index]
                                                                  .average!
                                                                  .toStringAsFixed(
                                                                      2)
                                                                  .toString()),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
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
                                                              Text((controller
                                                                          .subUtilityList[
                                                                              index]
                                                                          .dev
                                                                          .toString() !=
                                                                      "null")
                                                                  ? controller
                                                                      .subUtilityList[
                                                                          index]
                                                                      .hm!
                                                                      .toStringAsFixed(
                                                                          2)
                                                                      .toString()
                                                                  : "0"),
                                                              Text(
                                                                  "Deviation :"),
                                                              Text((controller
                                                                          .subUtilityList[
                                                                              index]
                                                                          .dev
                                                                          .toString() !=
                                                                      "null")
                                                                  ? controller
                                                                      .subUtilityList[
                                                                          index]
                                                                      .dev!
                                                                      .toStringAsFixed(
                                                                          2)
                                                                      .toString()
                                                                  : "0"),
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
                  ))
                : Expanded(
                    child: Scaffold(
                    backgroundColor: Color(0xFFF1F1F1),
                    body: Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller
                                .utilityController.utilitymachineList.length,
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
                                            controller
                                                .utilityController
                                                .utilitymachineList[index]
                                                .uitilityCategories
                                                .toString(),
                                            style: TextStyle(
                                                // fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.brown[500]
                                                // color: Colors.white
                                                ),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("EM",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15)),
                                                    Text("0",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black)),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("HM",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                        )),
                                                    Text("0",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                              height: 40,
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Average",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black)),
                                                    Text("0",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black)),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Deviation",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black)),
                                                    Text("0",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black)),
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .subUtilityController
                                              .filterData
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              int sIndex) {
                                            print("Hiii");
                                            print(controller.utilityController
                                                .utilitymachineList[index].id);
                                            print(controller
                                                .subUtilityController
                                                .subUtilityList[sIndex]
                                                .uitilityCategoriesId);
                                            return
                                              (controller
                                                        .utilityController
                                                        .utilitymachineList[
                                                            index]
                                                        .id ==
                                                    controller
                                                        .subUtilityController
                                                        .subUtilityList[sIndex]
                                                        .uitilityCategoriesId)
                                                ? Card(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 30,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Color(
                                                                0xFF6EB7A1),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  controller
                                                                      .subUtilityController
                                                                      .filterData[
                                                                          index]
                                                                          [
                                                                          'uilitysubc_name']
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          ),
                                                          // color: Color(0xFF6EB7A1),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text("EM : "),
                                                              Text(controller
                                                                  .subUtilityList[
                                                                      index]
                                                                  .em!
                                                                  .toStringAsFixed(
                                                                      2)
                                                                  .toString()),
                                                              Text(
                                                                  "Average : "),
                                                              Text(controller
                                                                  .subUtilityList[
                                                                      index]
                                                                  .average!
                                                                  .toStringAsFixed(
                                                                      2)
                                                                  .toString()),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
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
                                                              Text((controller
                                                                          .subUtilityList[
                                                                              index]
                                                                          .dev
                                                                          .toString() !=
                                                                      "null")
                                                                  ? controller
                                                                      .subUtilityList[
                                                                          index]
                                                                      .hm!
                                                                      .toStringAsFixed(
                                                                          2)
                                                                      .toString()
                                                                  : "0"),
                                                              Text(
                                                                  "Deviation :"),
                                                              Text((controller
                                                                          .subUtilityList[
                                                                              index]
                                                                          .dev
                                                                          .toString() !=
                                                                      "null")
                                                                  ? controller
                                                                      .subUtilityList[
                                                                          index]
                                                                      .dev!
                                                                      .toStringAsFixed(
                                                                          2)
                                                                      .toString()
                                                                  : "0"),
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
          )
        ],
      ),
    );
  }
}
