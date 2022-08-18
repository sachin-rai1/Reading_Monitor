import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/ThermoPack/Model/MachineList_Model_ThermoPack.dart';
import '../../../../data/Constants.dart';
import '../controllers/thermo_pack_controller.dart';

class ThermoPackView extends GetView<ThermoPackController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ThermoPackController());
    final w = MediaQuery.of(context).size.width;
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
                  Text("Coal 1 :"),
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
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Coal 1 Deviation :"),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      controller: controller.coal1Dev,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                      value!.isEmpty ? 'Coal 1 Deviation Required' : null,
                      decoration: InputDecoration(
                        hintText: "Coal 1 Deviation",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rate of Coal 1 :"),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Rate of Coal 1 Required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.rateOfCoal1,
                      decoration: InputDecoration(
                        hintText: "Coal Rate",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Coal 2 :"),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Rate of Coal 2 Required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.coal2,
                      decoration: InputDecoration(
                        hintText: "Coal 2",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Coal 2 Deviation :"),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Coal 2 Deviation Required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.coal2Dev,
                      decoration: InputDecoration(
                        hintText: "Coal 2 Deviation",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rate of Coal 2 :"),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Rate of Coal 2 Required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.rateOfCoal2,
                      decoration: InputDecoration(
                        hintText: "Coal Rate",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delta T :"),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Delta T Required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.deltaT1,
                      decoration: InputDecoration(
                        hintText: "Delta T",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delta T %  :"),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Delta T % Required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.deltaT2,
                      decoration: InputDecoration(
                        hintText: "Delta T %",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Chamber Cost :"),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Chamber Cost Required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.chamberCost1,
                      decoration: InputDecoration(
                        hintText: "Chamber Cost",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Chamber Cost % :"),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: w / 2,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Chamber Cost % Required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.chamberCost2,
                      decoration: InputDecoration(
                        hintText: "Chamber Cost % ",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
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
                    _formKey.currentState!.save();
                    controller.addThermoPack(ThermoPack(
                        coal1: int.parse(controller.coal1.text),
                        coal1Dev: int.parse(controller.coal1Dev.text),
                        rateOfCoal1: int.parse(controller.rateOfCoal1.text),
                        coal2: int.parse(controller.coal2.text),
                        coal2Dev: int.parse(controller.coal2Dev.text),
                        rateOfCoal2: int.parse(controller.rateOfCoal2.text),
                        deltaT1: int.parse(controller.deltaT1.text),
                        deltaT2: int.parse(controller.deltaT2.text),
                        chamberCost1: int.parse(controller.chamberCost1.text),
                        chamberCost2: int.parse(controller.chamberCost2.text)));
                    }
                  },
                  child: Container(
                      width: w / 2,
                      alignment: Alignment.center,
                      child: Text("Save"))),
            ],
          ),
        ),
      ),
    );
  }
}
