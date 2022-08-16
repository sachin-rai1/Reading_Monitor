import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/views/sub_utility_view.dart';
import '../controllers/utility_controller.dart';

class UtilityView extends GetView<UtilityController> {
  @override
  Widget build(BuildContext context) {
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
                  // controller.category.clear();
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
            child:
                // Obx(() {
                // if (controller.isLoading.value) {
                //   return const Center(child: CircularProgressIndicator());
                // } else {
                // return
                ListView.builder(
                    itemCount: 5,
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
                              Text("Hii"
                                  // controller.machineList[index].categories,
                                  ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        // controller.category.text = controller
                                        //     .machineList[index].categories
                                        //     .toString();
                                        // editDialog(context , int.parse(controller.machineList[index].id.toString()));
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
                                        // controller.category.text = controller
                                        //     .machineList[index].categories
                                        //     .toString();
                                        deleteDialog(context);
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
                      // });
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
        // if (_formKey.currentState!.validate()) {
        //   controller.updateMachine(
        //       controller.category.text, int.parse(id.toString()));
        //   Get.back();
        // }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Edit Machine"),
      content: Form(
        // key: _formKey,
        child: TextFormField(
            // controller: controller.category,
            // validator: (value) =>
            // value!.isEmpty ? 'Machine Name Required' : null,
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
        // controller
        //     .addMachine(ModelMachineList(categories: controller.category.text));
        // Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Machine"),
      content: TextFormField(
          // controller: controller.category,
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

  deleteDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
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
