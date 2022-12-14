import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/sub_utility_controller.dart';
import 'package:readingmonitor2/app/modules/MachineList/Utility/controllers/utility_controller.dart';

// import '../modules/Charts/Chart_GEB/Controllers/chart_g_e_b_Controller.dart';
// import '../modules/Charts/Chart_Machine/Controllers/chart_machine_Controller.dart';
// import '../modules/Charts/Chart_ManoMeter/Controllers/chart_mano_meter_Controller.dart';
// import '../modules/Charts/Chart_Misc/Controllers/chart_misc_Controller.dart';
// import '../modules/Charts/Chart_SteamBoiler/Controllers/chart_steam_boiler_Controller.dart';
// import '../modules/Charts/Chart_SupplyPump/Controllers/chart_supply_pump_Controller.dart';
// import '../modules/Charts/Chart_ThermoPack/Controllers/chart_thermo_pack_Controller.dart';
// import '../modules/Charts/Chart_Utility/Controllers/chart_utility_Controller.dart';
// import '../modules/Charts/Chart_WaterQuality/Controllers/chart_water_quality_Controller.dart';
// import '../modules/MachineComparison/Compare_FlueGas/Controllers/compare_flue_gas_Controller.dart';
// import '../modules/MachineComparison/Compare_GEB/Controllers/compare_g_e_b_Controller.dart';
// import '../modules/MachineComparison/Compare_Machine/Controllers/compare_machine_Controller.dart';
// import '../modules/MachineComparison/Compare_ManoMeter/Controllers/compare_mano_meter_Controller.dart';
// import '../modules/MachineComparison/Compare_Misc/Controllers/compare_misc_Controller.dart';
// import '../modules/MachineComparison/Compare_SteamBoiler/Controllers/compare_steam_boiler_Controller.dart';
// import '../modules/MachineComparison/Compare_SupplyPump/Controllers/compare_supply_pump_Controller.dart';
// import '../modules/MachineComparison/Compare_ThermoPack/Controllers/compare_thermo_pack_Controller.dart';
// import '../modules/MachineComparison/Compare_Utility/Controllers/compare_utility_Controller.dart';
// import '../modules/MachineComparison/Compare_WaterQuality/Controllers/compare_water_quality_Controller.dart';
// import '../modules/MachineList/FlueGas/controllers/flue_gas_controller_controller.dart';
// import '../modules/MachineList/GEB/Controllers/geb_Controller.dart';
// import '../modules/MachineList/Machine/Controllers/machine_Controller.dart';
// import '../modules/MachineList/MachineListTabBarNaviagtion/MachineListTabBarController.dart';
// import '../modules/MachineList/ManoMeter/Controllers/mano_meter_Controller.dart';
// import '../modules/MachineList/Misc/Controllers/misc_Controller.dart';
// import '../modules/MachineList/SteamBoiler/Controllers/steam_boiler_Controller.dart';
// import '../modules/MachineList/SupplyPump/Controllers/supply_pump_Controller.dart';
// import '../modules/MachineList/ThermoPack/Controllers/thermo_pack_Controller.dart';
// import '../modules/MachineList/WaterQuality/Controllers/water_quality_Controller.dart';
// import '../modules/TodayReport/ReportNavigation/controllers/report_tab_bar_controller.dart';
// import '../modules/TodayReport/Report_FlueGas/Controllers/report_flue_gas_Controller.dart';
// import '../modules/TodayReport/Report_GEB/Controllers/report_g_e_b_Controller.dart';
// import '../modules/TodayReport/Report_Machines/Controllers/report_machines_Controller.dart';
// import '../modules/TodayReport/Report_ManoMeter/Controllers/report_mano_meter_Controller.dart';
// import '../modules/TodayReport/Report_Misc/Controllers/report_misc_Controller.dart';
// import '../modules/TodayReport/Report_SteamBoiler/Controllers/report_steam_boiler_Controller.dart';
// import '../modules/TodayReport/Report_SupplyPump/Controllers/report_supply_pump_Controller.dart';
// import '../modules/TodayReport/Report_ThermoPack/Controllers/report_thermo_pack_Controller.dart';
// import '../modules/TodayReport/Report_Utilty/Controllers/report_utilty_Controller.dart';
// import '../modules/TodayReport/Report_WaterQuality/Controllers/report_water_quality_Controller.dart';
// import '../modules/Transition/Controllers/transition_Controller.dart';
// import '../modules/UploadData/UploadNavigationBar/UploadNavigationController.dart';
// import '../modules/UploadData/Upload_FlueGas/Controllers/upload_flue_gas_Controller.dart';
// import '../modules/UploadData/Upload_GEB/Controllers/upload_g_e_b_Controller.dart';
// import '../modules/UploadData/Upload_Machine/Controllers/upload_machine_Controller.dart';
// import '../modules/UploadData/Upload_ManoMeter/Controllers/upload_mano_meter_Controller.dart';
// import '../modules/UploadData/Upload_Misc/Controllers/upload_misc_Controller.dart';
// import '../modules/UploadData/Upload_SteamBoiler/Controllers/upload_steam_boiler_Controller.dart';
// import '../modules/UploadData/Upload_SupplyPump/Controllers/upload_supply_pump_Controller.dart';
// import '../modules/UploadData/Upload_ThermoPack/Controllers/upload_thermo_pack_Controller.dart';
// import '../modules/UploadData/Upload_Utility/Controllers/upload_utility_Controller.dart';
// import '../modules/UploadData/Upload_WaterQuality/Controllers/upload_water_quality_Controller.dart';
// import '../modules/home/Controllers/home_Controller.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtilityController>(() => UtilityController());
    Get.lazyPut<SubUtilityController>(() => SubUtilityController());
    // Get.lazyPut<ReportTabBarController>(() => ReportTabBarController());
    // Get.lazyPut<UploadTabBarController>(() => UploadTabBarController());
    // Get.lazyPut<MachineListTabBarController>(() => MachineListTabBarController());
    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<TransitionController>(() => TransitionController());
    // Get.lazyPut<SupplyPumpController>(() => SupplyPumpController());
    // Get.lazyPut<ThermoPackController>(() => ThermoPackController());
    // Get.lazyPut<SteamBoilerController>(() => SteamBoilerController());
    // Get.lazyPut<MachineController>(() => MachineController());
    // Get.lazyPut<WaterQualityController>(() => WaterQualityController());
    // Get.lazyPut<GebController>(() => GebController());
    // Get.lazyPut<ManoMeterController>(() => ManoMeterController());
    // Get.lazyPut<FlueGasControllerController>(() => FlueGasControllerController());
    // Get.lazyPut<MiscController>(() => MiscController());
    // Get.lazyPut<UploadUtilityController>(() => UploadUtilityController());
    // Get.lazyPut<UploadSteamBoilerController>(() => UploadSteamBoilerController());
    // Get.lazyPut<UploadThermoPackController>(() => UploadThermoPackController());
    // Get.lazyPut<UploadMachineController>(() => UploadMachineController());
    // Get.lazyPut<UploadWaterQualityController>(() => UploadWaterQualityController());
    // Get.lazyPut<UploadSupplyPumpController>(() => UploadSupplyPumpController());
    // Get.lazyPut<UploadGEBController>(() => UploadGEBController());
    // Get.lazyPut<UploadManoMeterController>(() => UploadManoMeterController());
    // Get.lazyPut<UploadFlueGasController>(() => UploadFlueGasController());
    // Get.lazyPut<UploadMiscController>(() => UploadMiscController());
    // Get.lazyPut<CompareUtilityController>(() => CompareUtilityController());
    // Get.lazyPut<CompareSteamBoilerController>(() => CompareSteamBoilerController());
    // Get.lazyPut<CompareThermoPackController>(() => CompareThermoPackController());
    // Get.lazyPut<CompareMachineController>(() => CompareMachineController());
    // Get.lazyPut<CompareWaterQualityController>(() => CompareWaterQualityController());
    // Get.lazyPut<CompareSupplyPumpController>(() => CompareSupplyPumpController());
    // Get.lazyPut<CompareGEBController>(() => CompareGEBController());
    // Get.lazyPut<CompareManoMeterController>(() => CompareManoMeterController());
    // Get.lazyPut<CompareFlueGasController>(() => CompareFlueGasController());
    // Get.lazyPut<CompareMiscController>(() => CompareMiscController());
    // // Get.lazyPut<ReportUtiltyController>(() => ReportUtiltyController());
    // Get.lazyPut<ReportSteamBoilerController>(() => ReportSteamBoilerController());
    // Get.lazyPut<ReportThermoPackController>(() => ReportThermoPackController());
    // Get.lazyPut<ReportMachinesController>(() => ReportMachinesController());
    // Get.lazyPut<ReportWaterQualityController>(() => ReportWaterQualityController());
    // Get.lazyPut<ReportSupplyPumpController>(() => ReportSupplyPumpController());
    // Get.lazyPut<ReportGEBController>(() => ReportGEBController());
    // Get.lazyPut<ReportManoMeterController>(() => ReportManoMeterController());
    // Get.lazyPut<ReportFlueGasController>(() => ReportFlueGasController());
    // Get.lazyPut<ReportMiscController>(() => ReportMiscController());
    // Get.lazyPut<ChartUtilityController>(() => ChartUtilityController());
    // Get.lazyPut<ChartSteamBoilerController>(() => ChartSteamBoilerController());
    // Get.lazyPut<ChartThermoPackController>(() => ChartThermoPackController());
    // Get.lazyPut<ChartMachineController>(() => ChartMachineController());
    // Get.lazyPut<ChartWaterQualityController>(() => ChartWaterQualityController());
    // Get.lazyPut<ChartSupplyPumpController>(() => ChartSupplyPumpController());
    // Get.lazyPut<ChartGEBController>(() => ChartGEBController());
    // Get.lazyPut<ChartManoMeterController>(() => ChartManoMeterController());
    // Get.lazyPut<ChartMiscController>(() => ChartMiscController());



  }
}
