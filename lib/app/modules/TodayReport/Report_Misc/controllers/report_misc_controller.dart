import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Misc/Model/ModelMiscReport.dart';
import '../../../../data/http_service_provider.dart';

class ReportMiscController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var isLoading = true.obs;
  var miscList = <ModelViewMisc>[].obs;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      fetchMiscViewReport();
    }
  }

  @override
  void onInit() {
    fetchMiscViewReport();
    super.onInit();
  }

  void fetchMiscViewReport() async {
    try {
      isLoading(true);
      var machine = await HttpServiceProvider.fetchMiscViewReport();
      miscList.value = machine;
    } finally {
      isLoading(false);
    }
  }
}
