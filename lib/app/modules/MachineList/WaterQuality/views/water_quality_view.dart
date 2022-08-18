import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/WaterQuality/Model/ModelWaterQuality.dart';

import '../controllers/water_quality_controller.dart';

class WaterQualityView extends GetView<WaterQualityController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(WaterQualityController());
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 70,
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 25,
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.clearData();
                      addDialog(context);
                    },
                    child: Row(
                      children: [Text("ADD"), Icon(Icons.add_box_outlined)],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                ),
                Container(
                  color: Color(0xff716259),
                  width: w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("TDS",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("TDS \n (%)",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("PH"),
                      Text("PH \n (%)"),
                      Text(
                        "Hardness",
                        style: TextStyle(),
                      ),
                      Column(
                        children: [
                          Text("Hardness"),
                          Text("%"),
                        ],
                      ),
                      Text("Edit  /\n Delete"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Card(
                child: Obx(
                  () => ListView.builder(
                      itemCount: controller.machineList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.machineList[index].machineName
                                    .toString()),
                                Text(controller.machineList[index].tds
                                    .toString()),
                                Text(controller.machineList[index].tdsPercentage
                                    .toString()),
                                Text(controller.machineList[index].ph
                                    .toString()),
                                Text(controller.machineList[index].phDeviation
                                    .toString()),
                                Text(controller.machineList[index].hardness
                                    .toString()),
                                Text(controller
                                    .machineList[index].hardnessPercentage
                                    .toString()),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.machineName.text = controller
                                            .machineList[index].machineName
                                            .toString();
                                        controller.tds.text = controller
                                            .machineList[index].tds
                                            .toString();
                                        controller.tdsPer.text = controller
                                            .machineList[index].tdsPercentage
                                            .toString();
                                        controller.ph.text = controller
                                            .machineList[index].ph
                                            .toString();
                                        controller.phPerc.text = controller
                                            .machineList[index].phDeviation
                                            .toString();
                                        controller.hardness.text = controller
                                            .machineList[index].hardness
                                            .toString();
                                        controller.hardnessPerc.text =
                                            controller.machineList[index]
                                                .hardnessPercentage
                                                .toString();
                                        editDialog(
                                            context,
                                            int.parse(controller
                                                .machineList[index].id
                                                .toString()));
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        deleteDialog(context , controller.machineList[index].id);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 0.9,
                              color: Colors.black,
                            )
                          ],
                        );
                      }),
                ),
              ))
        ],
      ),
    );
  }

  editDialog(BuildContext context, int id) {
    final h = MediaQuery.of(context).size.height;
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          controller.updateWaterQuality(
              controller.machineName.text,
              int.parse(controller.tds.text),
              int.parse(controller.tdsPer.text),
              int.parse(controller.ph.text),
              int.parse(controller.phPerc.text),
              int.parse(controller.hardness.text),
              int.parse(controller.hardnessPerc.text),
              int.parse(id.toString()));
          Get.back();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Edit Machine"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: h / 2,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "NAME"),
                  controller: controller.machineName,
                  validator: (value) =>
                      value!.isEmpty ? 'Machine Name Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "TDS"),
                  controller: controller.tds,
                  validator: (value) => value!.isEmpty ? 'TDS Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "TDS %"),
                  controller: controller.tdsPer,
                  validator: (value) => value!.isEmpty ? 'tds % Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "PH"),
                  controller: controller.ph,
                  validator: (value) => value!.isEmpty ? 'ph Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "PH %"),
                  controller: controller.phPerc,
                  validator: (value) => value!.isEmpty ? 'ph % Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "HARDNESS"),
                  controller: controller.hardness,
                  validator: (value) =>
                      value!.isEmpty ? 'Hardness Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "HARDNESS %"),
                  controller: controller.hardnessPerc,
                  validator: (value) =>
                      value!.isEmpty ? 'Hardness % Required' : null,
                ),
              ],
            ),
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
    final h = MediaQuery.of(context).size.height;
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          controller.addWaterQuality(ModelWaterQuality(
              machineName: controller.machineName.text,
              tds: int.parse(controller.tds.text),
              tdsPercentage: int.parse(controller.tdsPer.text),
              ph: int.parse(controller.ph.text),
              phDeviation: int.parse(controller.phPerc.text),
              hardness: int.parse(controller.hardness.text),
              hardnessPercentage: int.parse(controller.hardnessPerc.text)));

          Get.back();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Machine"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: h / 2,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Machine Name Required' : null,
                  controller: controller.machineName,
                  decoration: InputDecoration(hintText: "NAME"),
                ),
                TextFormField(
                  controller: controller.tds,
                  decoration: InputDecoration(hintText: "TDS"),
                  validator: (value) => value!.isEmpty ? 'TDS Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "TDS %"),
                  controller: controller.tdsPer,
                  validator: (value) =>
                      value!.isEmpty ? 'tds % Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "PH"),
                  controller: controller.ph,
                  validator: (value) => value!.isEmpty ? 'ph Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "PH %"),
                  controller: controller.phPerc,
                  validator: (value) => value!.isEmpty ? 'ph % Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "HARDNESS"),
                  controller: controller.hardness,
                  validator: (value) =>
                      value!.isEmpty ? 'Hardness Required' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "HARDNESS %"),
                  controller: controller.hardnessPerc,
                  validator: (value) =>
                      value!.isEmpty ? 'Hardness % Required' : null,
                ),
              ],
            ),
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

  deleteDialog(BuildContext context , id) {
    final h = MediaQuery.of(context).size.height;
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        controller.deleteWaterQuality(id);
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Machine"),
      content: Text("Are you sure want to delete this ?"),
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
