import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedDate = DateTime.now().obs;

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;

chooseDate() async
{
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
