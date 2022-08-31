import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_ThermoPack/Model/Upload_thermo_pack_model.dart';
import '../controllers/upload_thermo_pack_controller.dart';

class UploadThermoPackView extends GetView<UploadThermoPackController> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    Get.put(UploadThermoPackController());
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
                        if (controller.data.length > 0) {
                         controller.updateTask(
                             controller.selectedDate.value,
                              int.parse(controller.chambers.text.toString()),
                              int.parse(controller.coal1.text.toString()),
                              int.parse(controller.coal2.text.toString()),
                              int.parse(controller.inTemperature.text.toString()),
                              int.parse(controller.outTemperature.text.toString()),
                              int.parse(controller.pumpPressure.text.toString()),
                              int.parse(controller.circuitPressure.text.toString()),
                              int.parse(controller.id.toString()));
                          print(controller.data);
                        } else {
                         controller.addUploadThermoPack(ModelUploadThermoPack(
                              date:controller.selectedDate.value,
                              chamber: int.parse(controller.chambers.text),
                              coal1: int.parse(controller.coal1.text),
                              coal2: int.parse(controller.coal2.text),
                              inTemperature: int.parse(controller.inTemperature.text),
                              outTemperature: int.parse(controller.outTemperature.text),
                              pumpPresure: int.parse(controller.pumpPressure.text),
                              circuitPresure: int.parse(controller.circuitPressure.text)));
                        }
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
                Text("Chambers : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.chambers,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Coal 1 : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.coal1,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Coal 2 : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.coal2,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("In Temperature : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.inTemperature,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Out Temperature : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.outTemperature,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pump Pressure : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.pumpPressure,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Circuit Pressure : "),
                Container(
                    height: 42,
                    width: w / 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.circuitPressure,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
