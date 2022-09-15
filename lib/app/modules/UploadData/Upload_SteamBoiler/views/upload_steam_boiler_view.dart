import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/upload_steam_boiler_controller.dart';

class UploadSteamBoilerView extends GetView<UploadSteamBoilerController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    Get.put(UploadSteamBoilerController());
    return Container(
      padding: EdgeInsets.all(8),
      child: Form(
        key: _formKey,
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
                        if(_formKey.currentState!.validate()) {
                          controller.fetchUploadedSteamBoiler();
                        }
                      },
                      child: Text("Submit"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6EB7A1),
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BFW : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'BFW Required' : null,
                      controller: controller.bfw,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "BFW ",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Coal 1 : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      controller: controller.coal1,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                      value!.isEmpty ? 'Coal 1 Required' : null,
                      decoration: InputDecoration(
                        hintText: "Coal 1 ",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Coal 2 : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      controller: controller.coal2,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                      value!.isEmpty ? 'Coal 2 Required' : null,
                      decoration: InputDecoration(
                        hintText: "Coal 2",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BFW Temperature: ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      controller: controller.bfwEmperature,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                      value!.isEmpty ? 'BFW Temperature Required' : null,
                      decoration: InputDecoration(
                        hintText: "BFW Temp.",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
