import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/sub_utility_controller.dart';

class SubUtilityView extends GetView<SubUtilityController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SubUtilityController());
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
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
        titleSpacing: 00.0,
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
                )
              // ClipRRect(
              //   child: Image.asset(
              //     'assets/images/user1.png',
              //     height: 41.19,
              //     width: 41.19,
              //   ),
              // ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color(0xffCFE2D9),
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  'Machine Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Divider(thickness: 3, color: Color(0xFFBB8E88)),
                Container(
                  width: w,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Average",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Deviation \n Allowed (%)",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () {
                          addDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("ADD"), Icon(Icons.add_box_outlined)],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Card(
                child: ListView.builder(
                    itemCount: controller.subUtilityList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.subUtilityList[index].uilitysubcName.toString()),
                            Text(controller.subUtilityList[index].average.toString()),
                            Text(controller.subUtilityList[index].deviation.toString()),
                            GestureDetector(
                              onTap: () {
                                editDialog(context);
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                deleteDialog(context);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ))
        ],
      ),
    );
  }

  editDialog(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
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
              decoration: InputDecoration(hintText: "Machine Name"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Average"),
            ),
            TextFormField(
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
              decoration: InputDecoration(hintText: "Machine Name"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Average"),
            ),
            TextFormField(
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

  deleteDialog(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
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
