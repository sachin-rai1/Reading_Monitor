import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/SteamBoiler/Model/MachineList_Model_SteamBoiler.dart';
import '../controllers/steam_boiler_controller.dart';

class SteamBoilerView extends GetView<SteamBoilerController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SteamBoilerController());
    final w = MediaQuery.of(context).size.width;
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BFW : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    controller: controller.bfw1,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Temperature : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.bfwTemperature1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BFW % : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.bfw2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BFW Temperature % : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.bfwTemperature2,
                  ),
                ),
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
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.coal1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Coal 1 Deviation : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.coal1Div,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rate of Coal 1 :",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.rateOfCoal1,
                  ),
                ),
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
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.coal2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Coal 2 Deviation : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.coal2Div,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rate Of Coal 2 : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.rateOfCoal2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Steam Cost : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.steamCost1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Steam Cost % : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 42,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.steamCost2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  key.currentState?.save();
                  controller.addSteamBoiler(SteamBoiler(
                      bfw1: int.parse(controller.bfw1.text),
                      bfw2: int.parse(controller.bfw2.text),
                      coal1: int.parse(controller.coal1.text),
                      coal1Div: int.parse(controller.coal1Div.text),
                      rateOfCoal1: int.parse(controller.rateOfCoal1.text),
                      coal2: int.parse(controller.rateOfCoal2.text),
                      coal2Div: int.parse(controller.coal1Div.text),
                      rateOfCoal2: int.parse(controller.rateOfCoal2.text),
                      bfwTemperature1:
                          int.parse(controller.bfwTemperature1.text),
                      bfwTemperature2:
                          int.parse(controller.bfwTemperature2.text),
                      steamCost1: int.parse(controller.steamCost1.text),
                      steamCost2: int.parse(controller.steamCost2.text)));
                },
                child: Container(
                    width: w / 2,
                    alignment: Alignment.center,
                    child: Text("Save")))
          ],
        ),
      ),
    );
  }
}
