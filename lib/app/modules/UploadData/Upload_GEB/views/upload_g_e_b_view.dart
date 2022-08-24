import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/upload_g_e_b_controller.dart';

class UploadGEBView extends GetView<UploadGEBController> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    Get.put(UploadGEBController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                        controller.fetchUploadedGEB();
                      },
                      child: Text("Submit"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF6EB7A1),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("KWH : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.kwh  ,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("KVARH : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.kvarh,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("KVAH : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.kvah,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("MD : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.md,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TURBINE : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.turbine,
                    )),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
