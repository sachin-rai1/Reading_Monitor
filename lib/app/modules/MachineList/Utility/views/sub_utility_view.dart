import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/Model/ModelUtilitySubMachineList.dart';
import '../controllers/sub_utility_controller.dart';

class SubUtilityView extends GetView<SubUtilityController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SubUtilityController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: ClipRRect(
            child: Image.asset(
              'assets/images/RmLogo.png',
              height: 33,
              width: 124,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.subdirectory_arrow_left_sharp,
                    size: 40,
                    color: Colors.green,
                  )),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Color(0xffCFE2D9),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'SUB UTILITIES',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
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
                        Icon(Icons.add_box_outlined,
                            color: Colors.black, size: 15),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Card(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          itemCount: controller.filterData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.filterData[index]
                                                ['uilitysubc_name']
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.name.text = controller
                                                  .filterData[index]
                                                      ["uilitysubc_name"]
                                                  .toString();
                                              controller.average.text =
                                                  controller.filterData[index]
                                                          ["average"]
                                                      .toString();
                                              controller.deviation.text =
                                                  controller.filterData[index]
                                                          ["deviation"]
                                                      .toString();
                                              editDialog(
                                                  context,
                                                  int.parse(controller
                                                      .filterData[index][
                                                          "id"]
                                                      .toString()));
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.green,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              deleteDialog(
                                                  context,
                                                  controller.filterData[index]
                                                      ['id']);
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Average  : "),
                                      Text(controller.filterData[index]
                                              ['average']
                                          .toString()),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Deviation :  "),
                                      Text(controller.filterData[index]
                                              ['deviation']
                                          .toString()),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  }),
                ))
          ],
        ),
      ),
    );
  }

  editDialog(BuildContext context, int id) {
    final h = MediaQuery.of(context).size.height;
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        controller.updateUtilitySubMachine(
            controller.name.text,
            int.parse(controller.average.text),
            int.parse(controller.deviation.text),
            int.parse(id.toString())
        );
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Edit Machine"),
      content: Container(
        height: h / 5,
        child: Column(
          children: [
            TextFormField(
              controller: controller.name,
              decoration: InputDecoration(hintText: "Machine Name"),
            ),
            TextFormField(
              controller: controller.average,
              decoration: InputDecoration(hintText: "Average"),
            ),
            TextFormField(
              controller: controller.deviation,
              decoration: InputDecoration(hintText: "Deviation Allowed"),
            ),
          ],
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
        controller.addUtilitySubMachine(ModelUtilitySubMachineList(
            uilitysubcName: controller.name.text,
            uitilityCategoriesId: int.parse(controller.data1),
            average: int.parse(controller.average.text),
            deviation: int.parse(controller.deviation.text)));

        print(int.parse(controller.average.text));
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Machine"),
      content: Container(
        height: h / 5,
        child: Column(
          children: [
            TextFormField(
              controller: controller.name,
              decoration: InputDecoration(hintText: "Machine Name"),
            ),
            TextFormField(
              controller: controller.average,
              decoration: InputDecoration(hintText: "Average"),
            ),
            TextFormField(
              controller: controller.deviation,
              decoration: InputDecoration(hintText: "Deviation Allowed"),
            ),
          ],
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
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        controller.deleteUtilitySubMachine(id);
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
