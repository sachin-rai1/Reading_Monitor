import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Machine/Model/ModelMachineList.dart';
import 'package:readingmonitor2/app/modules/MachineList/SupplyPump/providers/http_service_provider.dart';

class UploadMiscController extends GetxController {
  TextEditingController machineName = TextEditingController();
  TextEditingController value = TextEditingController();
  TextEditingController machineId = TextEditingController();

  var selectedDate = DateTime.now().obs;
  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;

    }
  }


  @override
  void onInit() {
    fetchUploadMiscData();
    super.onInit();
  }
  var isLoading = true.obs;
  var machineList = <ModelMachineList>[].obs;

  Future<void> fetchUploadMiscData() async {
    try {
      isLoading(true);
      var machines = await HttpServiceProvider.fetchMachinelist();
      machineList.value = machines;
    } finally {
      isLoading(false);
    }
  }

}
