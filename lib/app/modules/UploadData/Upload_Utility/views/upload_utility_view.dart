import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../data/Constants.dart';
import '../controllers/upload_utility_controller.dart';

class UploadUtilityView extends GetView<UploadUtilityController> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    Get.put(UploadUtilityController());
    return Scaffold(
      body: Column(children: [
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
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
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
            // Container(
            //     alignment: Alignment.topRight,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         if (controller.data.length == 0) {
            //           controller.addUtilityList();
            //         } else {
            //           controller.uploadUtilityList();
            //         }
            //       },
            //       child: Text("Submit"),
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Color(0xFF6EB7A1),
            //       ),
            //     )),
          ],
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 25, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${controller.left_data} Machines Left"),
              ElevatedButton(
                onPressed: () {
                  _displayTextInputDialog(context);
                  // if (controller.data.length == 0) {
                  //   controller.addUtilityList();
                  // } else {
                  //   controller.uploadUtilityList();
                  // }
                },
                child: Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6EB7A1),
                ),
              )
            ],
          ),
        )
        // const SizedBox(height: 20),
        // (controller.isLoading.value)
        //     ? SizedBox(
        //         height: 500,
        //         child: Center(
        //           child: CircularProgressIndicator(
        //             color: Constants.primaryColor,
        //           ),
        //         ),
        //       ):
        //
        //     (controller.data.length == 0)
        //         ? Expanded(
        //             flex: 2,
        //             child: Obx(
        //               () {
        //                 if (controller.isLoading.value) {
        //                   return const Center(
        //                       child: CircularProgressIndicator());
        //                 } else {
        //                   print(" Null data   Hiiiiii");
        //                   // print(controller.flow);
        //                   return ListView.builder(
        //                       itemCount: 2,
        //                       itemBuilder: (context,index) {
        //                         return Card(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        //                                 Row(
        //                                   children: [
        //                                     Container(
        //                                       height: 30,
        //                                       width: w / 4,
        //                                       child: Text(
        //                                         controller.utilityController
        //                                             .utilitymachineList[index].uitilityCategories
        //                                             .toString(),
        //                                         // "Machine Name",
        //                                         style: TextStyle(
        //                                             fontWeight:
        //                                                 FontWeight.bold),
        //                                       ),
        //                                     ),
        //                                     Container(
        //                                       decoration: BoxDecoration(
        //                                           border: Border.all(
        //                                               color: Colors.blueAccent,
        //                                               width: 2),
        //                                           borderRadius:
        //                                               BorderRadius.circular(
        //                                                   10)),
        //                                       child: TextFormField(
        //                                         decoration: InputDecoration(),
        //                                         controller:
        //                                         controller.hmText[index],
        //                                       ),
        //                                       height: 30,
        //                                       width: w / 4,
        //                                     ),
        //                                     Container(
        //                                       decoration: BoxDecoration(
        //                                           border: Border.all(
        //                                               color: Colors.blueAccent,
        //                                               width: 2),
        //                                           borderRadius:
        //                                               BorderRadius.circular(
        //                                                   10)),
        //                                       child: TextFormField(
        //                                           controller:
        //                                           controller.emText[index],
        //                                           ),
        //                                       height: 30,
        //                                       width: w / 4,
        //                                     ),
        //                                   ],
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.spaceBetween,
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         );
        //                       });
        //                 }
        //               },
        //             ),
        //           )
        //         : Expanded(
        //             flex: 2,
        //             child: Obx(
        //               () {
        //                 if (controller.isLoading.value) {
        //                   return const Center(
        //                       child: CircularProgressIndicator());
        //                 } else {
        //                   print("Hawaii");
        //                   // print(controller.flow);
        //                   return ListView.builder(
        //                       itemCount: 2,
        //                       // supplyController.supplyPumpList.length,
        //                       itemBuilder: (context, index) {
        //                         return Card(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        //                                 Row(
        //                                   children: [
        //                                     Container(
        //                                       height: 30,
        //                                       width: w / 4,
        //                                       child: Text(
        //                                         // supplyController
        //                                         //     .supplyPumpList[index].name
        //                                         //     .toString(),
        //                                         "Machine Name",
        //                                         style: TextStyle(
        //                                             fontWeight:
        //                                                 FontWeight.bold),
        //                                       ),
        //                                     ),
        //                                     Container(
        //                                       decoration: BoxDecoration(
        //                                           border: Border.all(
        //                                               color: Colors.blueAccent,
        //                                               width: 2),
        //                                           borderRadius:
        //                                               BorderRadius.circular(
        //                                                   10)),
        //                                       child: TextFormField(
        //                                         decoration: InputDecoration(),
        //                                         controller:
        //                                         controller.hmText[index],
        //                                       ),
        //                                       height: 30,
        //                                       width: w / 4,
        //                                     ),
        //                                     Container(
        //                                       decoration: BoxDecoration(
        //                                           border: Border.all(
        //                                               color: Colors.blueAccent,
        //                                               width: 2),
        //                                           borderRadius:
        //                                               BorderRadius.circular(
        //                                                   10)),
        //                                       child: TextFormField(
        //                                           controller:
        //                                           controller.emText[index],
        //                                           ),
        //                                       height: 30,
        //                                       width: w / 4,
        //                                     ),
        //                                   ],
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.spaceBetween,
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         );
        //                       });
        //                 }
        //               },
        //             ),
        //           )
      ]),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Form(
            // key: _formKey,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              title: Text(
                "Add New Machine",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 20,
                  fontFamily: Constants.popinsbold,
                ),
              ),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  return SizedBox(
                    height: height / 4,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 60,
                        //   child:
                        //   TextFormField(
                        //     validator: (value) =>
                        //     value!.isEmpty ? 'Machine Name Required' : null,
                        //     // controller: controller.machineNameTextController,
                        //     style: TextStyle(
                        //       fontFamily: Constants.popins,
                        //       // color: Constants.textColor,
                        //     ),
                        //     decoration: InputDecoration(
                        //         hintText: "Enter Machine Name",
                        //         contentPadding: const EdgeInsets.only(
                        //             bottom: 10.0, left: 10.0),
                        //         isDense: true,
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(8.0),
                        //         ),
                        //         enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(8.0),
                        //           borderSide: BorderSide(
                        //               color: Colors.grey.shade300, width: 1.0),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color: Constants.primaryColor,
                        //               width: 2.0),
                        //           borderRadius: BorderRadius.circular(8.0),
                        //         ),
                        //         filled: true,
                        //         hintStyle: TextStyle(
                        //             color: Colors.grey[400],
                        //             fontFamily: Constants.popins,
                        //             fontSize: 14),
                        //         labelStyle: TextStyle(
                        //             color: Colors.grey[400],
                        //             fontFamily: Constants.popins,
                        //             fontSize: 14),
                        //         // hintText: "first name",
                        //         fillColor: Colors.white70),
                        //   ),
                        // ),
                        // DropdownButtonFormField(
                        //     decoration: InputDecoration(
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide:
                        //             BorderSide(color: Colors.blue, width: 2),
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderSide:
                        //             BorderSide(color: Colors.blue, width: 2),
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       filled: true,
                        //       fillColor: Colors.blueAccent,
                        //     ),
                        //     dropdownColor: Colors.blueAccent,
                        //     value: controller.selectedValue,
                        //     onChanged: (String? newValue) {
                        //        controller.selectedValue = newValue!;
                        //     },
                        //     items: controller.utilityController.utilitymachineList
                        // ),

                        SizedBox(
                          height: 60,
                          // width: w * 0.25,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                value!.isEmpty ? 'Average required' : null,
                            // controller: controller.averageTextController,
                            style: TextStyle(
                              fontFamily: Constants.popins,
                              // color: Constants.textColor,
                            ),
                            decoration: InputDecoration(
                                hintText: "Flow/Unit Average",
                                contentPadding: const EdgeInsets.only(
                                    bottom: 10.0, left: 10.0),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                // hintText: "first name",
                                fillColor: Colors.white70),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          // width: w * 0.25,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                value!.isEmpty ? 'Deviation required' : null,
                            // controller: controller.deviationTextController,
                            style: TextStyle(
                              fontFamily: Constants.popins,
                              // color: Constants.textColor,
                            ),
                            decoration: InputDecoration(
                                hintText: "Deviation",
                                contentPadding: const EdgeInsets.only(
                                    bottom: 10.0, left: 10.0),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                // hintText: "first name",
                                fillColor: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              actions: <Widget>[
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   _formKey.currentState?.save();
                        //   controller.addSupplyPump(ModelSupplyPump(
                        //       name: controller.machineNameTextController.text,
                        //       average: int.parse(
                        //           controller.averageTextController.text),
                        //       deviation: int.parse(
                        //           controller.deviationTextController.text)));
                        // }
                      },
                      style: ButtonStyle(
                          textStyle:
                              MaterialStateProperty.all<TextStyle>(TextStyle(
                            fontSize: 16,
                            fontFamily: Constants.popins,
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.primaryColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "Add",
                            style: TextStyle(
                              // color: Colors.white,
                              fontSize: 16,
                              fontFamily: Constants.popins,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        });
  }

  Future<void> _updateDialog(BuildContext context, int id) async {
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            title: Text(
              "Update Machine",
              style: TextStyle(
                // color: Colors.white,
                fontSize: 20,
                fontFamily: Constants.popinsbold,
              ),
            ),
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var height = MediaQuery.of(context).size.height;
                return Form(
                  key: key,
                  child: SizedBox(
                    height: height / 3,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          // width: w * 0.45,
                          child: TextFormField(
                            // controller: controller.machineNameTextController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Machine name is required.';
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontFamily: Constants.popins,
                              // color: Constants.textColor,
                            ),
                            decoration: InputDecoration(
                                hintText: "Enter Machine Name",
                                contentPadding: const EdgeInsets.only(
                                    bottom: 10.0, left: 10.0),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                // hintText: "first name",
                                fillColor: Colors.white70),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          // width: w * 0.25,
                          child: TextFormField(
                            // controller: controller.averageTextController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Average is required.';
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontFamily: Constants.popins,
                              // color: Constants.textColor,
                            ),
                            decoration: InputDecoration(
                                hintText: "Flow/Unit Average",
                                contentPadding: const EdgeInsets.only(
                                    bottom: 10.0, left: 10.0),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                // hintText: "first name",
                                fillColor: Colors.white70),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            // controller: controller.deviationTextController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Unit is required.';
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontFamily: Constants.popins,
                            ),
                            decoration: InputDecoration(
                                hintText: "Deviation",
                                contentPadding: const EdgeInsets.only(
                                    bottom: 10.0, left: 10.0),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.popins,
                                    fontSize: 14),
                                // hintText: "first name",
                                fillColor: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            actions: <Widget>[
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // if (key.currentState!.validate()) {
                    //   controller.updateTask(
                    //     controller.machineNameTextController.text,
                    //     int.parse(
                    //         controller.averageTextController.text.toString()),
                    //     int.parse(
                    //         controller.deviationTextController.text.toString()),
                    //     int.parse(id.toString()),
                    //   );
                    // }
                  },
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                        fontSize: 16,
                        fontFamily: Constants.popins,
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Constants.primaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.update,
                        color: Colors.white,
                        size: 16,
                      ),
                      Text(
                        "Update",
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 14,
                          fontFamily: Constants.popins,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  Future<void> _deleteMachineDialog(BuildContext context, int id) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            title: Text(
              "Are you sure to Delete ?",
              style: TextStyle(
                // color: Colors.white,
                fontSize: 20,
                fontFamily: Constants.popins,
              ),
            ),
            actions: <Widget>[
              Container(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                        fontSize: 16,
                        fontFamily: Constants.popins,
                      )),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontFamily: Constants.popins,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // controller.deleteSupplyPump(id);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                        fontSize: 16,
                        fontFamily: Constants.popins,
                      )),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                      fontFamily: Constants.popins,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
