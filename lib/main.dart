import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readingmonitor2/app/data/NetworkBinding.dart';

import 'app/routes/app_pages.dart';

void main() async {

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: NetworkBinding(),

    ),
  );
}


