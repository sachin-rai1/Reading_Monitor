import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/utility_controller.dart';
import '../../../../data/Constants.dart';
import '../controllers/upload_misc_controller.dart';

class UploadMiscView extends GetView<UploadMiscController> {
  final utilityController = Get.put(UtilityController());
  @override
  Widget build(BuildContext context) {
    Get.put(UploadMiscController());
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
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
                        controller.addMiscList();
                      } else {
                        controller.updateMiscList();
                      }
                    },
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF6EB7A1),
                    ),
                  )),
            ],
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: utilityController.utilitymachineList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.listdata[index].uitilityCategories
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: Constants.popins,
                                      color: Constants.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Value",
                                      style: TextStyle(
                                          fontFamily: Constants.popins,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: 35,
                                      width: w * 0.35,
                                      child: TextField(
                                        controller: controller.valueUnit[index],
                                        style: TextStyle(
                                          fontFamily: Constants.popins,
                                          // color: Constants.textColor,
                                        ),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    bottom: 10.0, left: 10.0),
                                            isDense: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Constants.primaryColor,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            hintStyle: TextStyle(
                                              color: Colors.grey[400],
                                              fontFamily: Constants.popins,
                                            ),
                                            // hintText: "first name",
                                            fillColor: Colors.white70),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
