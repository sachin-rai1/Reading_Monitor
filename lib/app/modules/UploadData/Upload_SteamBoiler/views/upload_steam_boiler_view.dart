import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/upload_steam_boiler_controller.dart';

class UploadSteamBoilerView extends GetView<UploadSteamBoilerController> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    Get.put(UploadSteamBoilerController());
    return Container(
      padding: EdgeInsets.all(8),
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
                            child: Obx(() =>
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
                ],
              ),
              Container(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.fetchUploadedSteamBoiler();
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
              Text(
                "BFW : ",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                  height: 42,
                  width: w / 2,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)),
                  child: TextFormField(
                    controller: controller.bfw,
                    keyboardType: TextInputType.number,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Coal 1 : ",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                  height: 42,
                  width: w / 2,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)),
                  child: TextFormField(
                    controller: controller.coal1,
                    keyboardType: TextInputType.number,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Coal 2 : ",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                  height: 42,
                  width: w / 2,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)),
                  child: TextFormField(
                    controller: controller.coal2,
                    keyboardType: TextInputType.number,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BFW Temperature: ",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                  height: 42,
                  width: w / 2,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)),
                  child: TextFormField(
                    controller: controller.bfwEmperature,
                    keyboardType: TextInputType.number,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
