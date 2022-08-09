import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../home/controllers/home_controller.dart';
import '../controllers/chart_utility_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartUtilityView extends GetView<ChartUtilityController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child : Text("This IS Utility Chart"),
    );
  }
  }