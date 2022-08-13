import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/data/ConnectionString.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      controller: controller.bfw1,
                      validator: (value) =>
                          value!.isEmpty ? 'BFW required' : null,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "BFW",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.bfwTemperature1,
                      validator: (value) =>
                          value!.isEmpty ? 'Temperature required' : null,
                      decoration: InputDecoration(
                        hintText: "Temperature",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.bfw2,
                      validator: (value) =>
                          value!.isEmpty ? 'BFW % required' : null,
                      decoration: InputDecoration(
                        hintText: "BFW %",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'BFW Temp. Required' : null,
                      controller: controller.bfwTemperature2,
                      decoration: InputDecoration(
                        hintText: "BFW Temp . %",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
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
                      validator: (value) =>
                          value!.isEmpty ? 'Coal 1 Required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.coal1,
                      decoration: InputDecoration(
                        hintText: "Coal 1",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Coal 1 Deviation Required' : null,
                      controller: controller.coal1Div,
                      decoration: InputDecoration(
                        hintText: "Coal 1 Deviation ",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Coal Rate Required' : null,
                      controller: controller.rateOfCoal1,
                      decoration: InputDecoration(
                        hintText: "Coal Rate",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
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
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Coal 2 Required' : null,
                      controller: controller.coal2,
                      decoration: InputDecoration(
                        hintText: "Coal 2 ",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Coal 2 % Required' : null,
                      controller: controller.coal2Div,
                      decoration: InputDecoration(
                        hintText: "Coal 2 %",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Coal Rate Required' : null,
                      controller: controller.rateOfCoal2,
                      decoration: InputDecoration(
                        hintText: "Coal Rate",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Steam Cost Required' : null,
                      controller: controller.steamCost1,
                      decoration: InputDecoration(
                        hintText: "Steam Cost ",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Steam Cost % Required' : null,
                      controller: controller.steamCost2,
                      decoration: InputDecoration(
                        hintText: "Steam Cost %",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Constants.primaryColor),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
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
                    }
                  },
                  child: Container(
                      width: w / 2,
                      alignment: Alignment.center,
                      child: Text("Save")))

            ],
          ),
        ),
      ),
    );
  }
}
