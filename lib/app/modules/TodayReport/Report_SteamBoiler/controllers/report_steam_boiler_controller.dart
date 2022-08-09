import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportSteamBoilerController extends GetxController {
  var selectedDate = DateTime.now().obs;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now()
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }
}
