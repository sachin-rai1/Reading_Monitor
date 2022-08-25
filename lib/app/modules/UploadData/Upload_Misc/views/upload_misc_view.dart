import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/upload_misc_controller.dart';

class UploadMiscView extends GetView<UploadMiscController> {
  @override
  Widget build(BuildContext context) {
    Get.put(UploadMiscController());
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
                    controller.fetchUploadMiscData();
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF6EB7A1),
                  ),
                )),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Machine Name"),
            Text("Value"),
          ]),
        ),
        Expanded(
          flex: 2,
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: controller.machineList.length,
                    itemBuilder: (context, index) {
                      if (controller.machineList.isNotEmpty) {
                        controller.machineId.text =
                            controller.machineList[index].id.toString();
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.machineList[index].categories),
                                Text(controller.machineList[index].id.toString()),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blueAccent, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    controller: controller.machineId,
                                  ),
                                  height: 30,
                                  width: w / 3,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blueAccent, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                      // controller: controller.flow,
                                      ),
                                  height: 30,
                                  width: w / 3,
                                ),
                              ],
                            ),
                          ],
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
