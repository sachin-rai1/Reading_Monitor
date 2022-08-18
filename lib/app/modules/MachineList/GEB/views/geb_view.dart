import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/geb_controller.dart';

class GebView extends GetView<GebController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    Get.lazyPut(() => GebController());
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    final w = MediaQuery.of(context).size.width;
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
                  "KWH : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.kwh,
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
                  "KWH Deviation : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.devKwh,
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
                  "KVARH : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.kvarh,
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
                  "KVARH Deviation : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.devKvarh,
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
                  "KVAH : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.kvah,
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
                  "KVAH Deviation : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.devKvah,
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
                  "PF : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.pf,
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
                  "PF Deviation : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.devPf,
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
                  "MD : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.md,
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
                  "MD Deviation : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.devMd,
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
                  "Turbine : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.tb,
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
                  "MF : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.mf,
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
                  "Deviation Turbine : ",
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
                    keyboardType: TextInputType.number,
                    controller: controller.devTb,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  key.currentState?.save();
                  controller.fetchGebList(3
                      // int.parse(controller.gebMAchineList[0].id.toString()
                      );
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
