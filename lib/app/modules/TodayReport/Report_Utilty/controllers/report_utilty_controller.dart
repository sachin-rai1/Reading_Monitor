import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/TodayReport/Report_Utilty/Model/ModelViewUtility.dart';
import '../../../../data/http_service_provider.dart';

class ReportUtiltyController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var isLoading = true.obs;
  var utilityList = <ModelViewUtility>[].obs;

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now()
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      fetchUtilityViewReport();
    }
  }

  void fetchUtilityViewReport() async {
    try {
      isLoading(true);
      var utility = await HttpServiceProvider.fetchUtilityViewReport();
      utilityList.value = utility ;
    } finally {
      isLoading(false);
    }
  }

}
