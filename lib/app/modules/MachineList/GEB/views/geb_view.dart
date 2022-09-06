import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/geb_controller.dart';

class GebView extends GetView<GebController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.kwh,
                    validator: (value) =>
                        value!.isEmpty ? 'KWH Required' : null,
                    decoration: InputDecoration(
                      hintText: "KWH",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "KWH Deviation : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.devKwh,
                    validator: (value) =>
                        value!.isEmpty ? 'KWH deviation Required' : null,
                    decoration: InputDecoration(
                      hintText: "KWH deviation",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "KVARH : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.kvarh,
                    validator: (value) =>
                        value!.isEmpty ? 'KVARH Required' : null,
                    decoration: InputDecoration(
                      hintText: "KVARH",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "KVARH Deviation : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.devKvarh,
                    validator: (value) =>
                        value!.isEmpty ? 'KVARH Deviation Required' : null,
                    decoration: InputDecoration(
                      hintText: "KVARH Deviation",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "KVAH : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.kvah,
                    validator: (value) =>
                        value!.isEmpty ? 'KVAH Required' : null,
                    decoration: InputDecoration(
                      hintText: "KVAH",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "KVAH Deviation : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.devKvah,
                    validator: (value) =>
                        value!.isEmpty ? 'KVAH Deviation Required' : null,
                    decoration: InputDecoration(
                      hintText: "KVAH Deviation",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "PF : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.pf,
                    validator: (value) => value!.isEmpty ? 'PF Required' : null,
                    decoration: InputDecoration(
                      hintText: "PF",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "PF Deviation : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.devPf,
                    validator: (value) =>
                        value!.isEmpty ? 'Pf Deviation Required' : null,
                    decoration: InputDecoration(
                      hintText: "PF Deviation",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "MD : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.md,
                    validator: (value) => value!.isEmpty ? 'md Required' : null,
                    decoration: InputDecoration(
                      hintText: "MD",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "MD Deviation : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.devMd,
                    validator: (value) =>
                        value!.isEmpty ? 'md Deviation Required' : null,
                    decoration: InputDecoration(
                      hintText: "MD Deviation ",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "Turbine : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.tb,
                    validator: (value) =>
                        value!.isEmpty ? 'Turbine Required' : null,
                    decoration: InputDecoration(
                      hintText: "Turbine",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "MF : ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.mf,
                    validator: (value) => value!.isEmpty ? 'mf Required' : null,
                    decoration: InputDecoration(
                      hintText: "MF",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
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
                Text(
                  "Turbine Deviation: ",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: w / 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.devTb,
                    validator: (value) =>
                        value!.isEmpty ? 'Turbine Deviation Required' : null,
                    decoration: InputDecoration(
                      hintText: "Turbine Deviation",
                      contentPadding:
                          const EdgeInsets.only(bottom: 10.0, left: 10.0),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
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
                  if (_formKey.currentState!.validate()) {
                    key.currentState?.save();
                    controller.fetchGebList(1);
                  }
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
