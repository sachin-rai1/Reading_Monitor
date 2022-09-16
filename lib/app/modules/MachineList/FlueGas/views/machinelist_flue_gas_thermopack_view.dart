import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/Model/ModelFlueGasThermoPack.dart';
import 'package:readingmonitor2/app/modules/MachineList/FlueGas/controllers/flue_gas_controller_controller.dart';
import 'package:styled_text/styled_text.dart';

import '../../../../data/Constants.dart';

class MachinelistFlueGasThermopackView
    extends GetView<FlueGasControllerController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(FlueGasControllerController);
    return Scaffold(
        body: Column(
      children: [
        Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.topRight,
            child: ElevatedButton(
                onPressed: () {
                  controller.clearThermopack();
                  addDialog(context);
                },
                child: Text("Add"))),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            if (controller.isLoadingThermopack.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return RefreshIndicator(
                onRefresh: (){return Future(() => controller.fetchFlueGasThermoPack());},
                child: ListView.builder(
                    itemCount: controller.thermoPackmachineList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller
                                        .thermoPackmachineList[index].machineName
                                        .toString()
                                        .toUpperCase(),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            controller.thermoPack.text =
                                                controller
                                                    .thermoPackmachineList[index]
                                                    .machineName
                                                    .toString();
                                            controller.thermoPackValue.text =
                                                controller
                                                    .thermoPackmachineList[index]
                                                    .value
                                                    .toString();
                                            controller.thermoPackValuePer.text =
                                                controller
                                                    .thermoPackmachineList[index]
                                                    .deviation
                                                    .toString();
                                            controller.thermoPackTemp.text =
                                                controller
                                                    .thermoPackmachineList[index]
                                                    .temperature
                                                    .toString();
                                            controller.thermoPackTempPer.text =
                                                controller
                                                    .thermoPackmachineList[index]
                                                    .temperatureDeviation
                                                    .toString();
                                            editDialog(
                                                context,
                                                int.parse(controller
                                                    .thermoPackmachineList[index]
                                                    .id
                                                    .toString()));
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.green,
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            controller.thermoPack.text =
                                                controller
                                                    .thermoPackmachineList[index]
                                                    .machineName
                                                    .toString();
                                            deleteDialog(
                                                context,
                                                controller
                                                    .thermoPackmachineList[index]
                                                    .id);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Value : "),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Temp : "),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(controller
                                          .thermoPackmachineList[index].value
                                          .toString()),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(controller.thermoPackmachineList[index]
                                          .temperature
                                          .toString()),
                                    ],
                                  ),
                                  Container(
                                      height: 30,
                                      child: VerticalDivider(
                                        thickness: 2,
                                        color: Colors.redAccent,
                                      )),
                                  Column(
                                    children: [
                                      Text("Value % : "),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Temp % : "),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(controller
                                          .thermoPackmachineList[index].deviation
                                          .toString()),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(controller.thermoPackmachineList[index]
                                          .temperatureDeviation
                                          .toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                      // });
                    }),
              );
            }
          }),
        ))
      ],
    ));
  }

  editDialog(BuildContext context, int id) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          controller.updateFlueGasThermopack(
              controller.thermoPack.text,
              int.parse(controller.thermoPackValue.text),
              int.parse(controller.thermoPackValuePer.text),
              int.parse(controller.thermoPackTemp.text),
              int.parse(controller.thermoPackTempPer.text),
              int.parse(id.toString()));
          Get.back();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Edit Machine"),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: controller.thermoPack,
                validator: (value) =>
                    value!.isEmpty ? 'Machine Name Required' : null,
              ),
              TextFormField(
                controller: controller.thermoPackValue,
                validator: (value) => value!.isEmpty ? 'Value Required' : null,
              ),
              TextFormField(
                controller: controller.thermoPackValuePer,
                validator: (value) =>
                    value!.isEmpty ? 'Value % Required' : null,
              ),
              TextFormField(
                controller: controller.thermoPackTemp,
                validator: (value) => value!.isEmpty ? 'Temp required' : null,
              ),
              TextFormField(
                controller: controller.thermoPackTempPer,
                validator: (value) => value!.isEmpty ? 'Temp % Required' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  addDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          controller.addFlueGasThermopack(ModelFlueGasThermopack(
            machineName: controller.thermoPack.text,
            value: int.parse(controller.thermoPackValue.text.toString()),
            deviation: int.parse(controller.thermoPackValuePer.text.toString()),
            temperature: int.parse(controller.thermoPackTemp.text.toString()),
            temperatureDeviation:
                int.parse(controller.thermoPackTempPer.text.toString()),
          ));
          Get.back();
        }
        // print(controller.categories.text);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Machine"),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: controller.thermoPack,
                validator: (value) =>
                    value!.isEmpty ? 'Machine Name Required' : null,
                decoration: InputDecoration(hintText: "Machine Name"),
              ),
              TextFormField(
                controller: controller.thermoPackValue,
                validator: (value) => value!.isEmpty ? 'Value Required' : null,
                decoration: InputDecoration(hintText: "Value"),
              ),
              TextFormField(
                controller: controller.thermoPackValuePer,
                validator: (value) =>
                    value!.isEmpty ? 'Value % Required' : null,
                decoration: InputDecoration(hintText: "Value %"),
              ),
              TextFormField(
                controller: controller.thermoPackTemp,
                validator: (value) => value!.isEmpty ? 'Temp required' : null,
                decoration: InputDecoration(hintText: "Temp "),
              ),
              TextFormField(
                controller: controller.thermoPackTempPer,
                validator: (value) => value!.isEmpty ? 'Temp % Required' : null,
                decoration: InputDecoration(hintText: "Temp % "),
              ),
            ],
          ),
        ),
      ),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  deleteDialog(BuildContext context, id) {
    // set up the button
    Widget okButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                  fontSize: 16,
                  fontFamily: Constants.popins,
                )),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
            child: Text("No")),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                fontSize: 16,
                fontFamily: Constants.popins,
              )),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          child: Text("Yes"),
          onPressed: () {
            controller.deleteFlueGasThermoPack(id);
            Get.back();
          },
        ),
      ],
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
        "Are you sure to delete ?",
        style: TextStyle(fontWeight: FontWeight.normal),
      )),
      content: Container(
        height: 20,
        child: Center(
          child: Text(controller.thermoPack.text.toUpperCase(),style : TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
