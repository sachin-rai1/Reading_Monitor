import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/Model/ModelUtilityMachineList.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/views/sub_utility_view.dart';
import '../controllers/utility_controller.dart';

class UtilityView extends GetView<UtilityController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => (UtilityController()));

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5, right: 10, left: 10),
          decoration: BoxDecoration(color: Color(0xFFC5E2D9)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Machine List ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  addDialog(context);
                },
                child: Row(
                  children: [
                    Text(
                      "Add",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.add_box_outlined, color: Colors.black, size: 15),
                  ],
                ),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: controller.utilitymachineList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => SubUtilityView());
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.utilitymachineList[index]
                                    .uitilityCategories
                                    .toString(),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        controller.categories.text = controller
                                            .utilitymachineList[index]
                                            .uitilityCategories
                                            .toString();
                                        editDialog(
                                            context,
                                            int.parse(controller
                                                .utilitymachineList[index].id
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
                                        controller.categories.text = controller
                                            .utilitymachineList[index].uitilityCategories
                                            .toString();
                                        deleteDialog(context, controller
                                            .utilitymachineList[index].id
                                            );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
            }),
          ),
        )
      ],
    );
  }

  editDialog(BuildContext context, int id) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          controller.updateUtilityMachine(
              controller.categories.text, int.parse(id.toString()));
          Get.back();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Edit Machine"),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: controller.categories,
          validator: (value) => value!.isEmpty ? 'Machine Name Required' : null,
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
          controller.addUtilityMachine(ModelUtilityMachineList(
              uitilityCategories: controller.categories.text.toString()));
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
        child: TextFormField(
          controller: controller.categories,
          validator: (value) => value!.isEmpty ? 'Machine Name Required' : null,
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
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        controller.deleteUtilityMachine(id);
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Machine"),
      content: Text("Do you want to delete this machine ?"),
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
