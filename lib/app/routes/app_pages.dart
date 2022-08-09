import 'package:get/get.dart';
import 'package:readingmonitor2/app/modules/MachineList/MachineListTabBarNaviagtion/MachineListTabBar.dart';


import 'package:readingmonitor2/app/modules/Transition/bindings/transition_binding.dart';
import 'package:readingmonitor2/app/modules/Transition/views/transition_view.dart';
import 'package:readingmonitor2/app/modules/UploadData/Upload_FlueGas/views/upload_flue_gas_view.dart';
import 'package:readingmonitor2/app/modules/home/bindings/home_binding.dart';
import 'package:readingmonitor2/app/modules/home/views/home_view.dart';
import 'package:readingmonitor2/app/modules/login/bindings/login_binding.dart';
import 'package:readingmonitor2/app/modules/login/views/login_view.dart';

import '../modules/Charts/Chart_FlueGas/bindings/chart_flue_gas_binding.dart';
import '../modules/Charts//Chart_GEB/bindings/chart_g_e_b_binding.dart';
import '../modules/Charts/Chart_GEB/views/chart_g_e_b_view.dart';
import '../modules/Charts/Chart_Machine/bindings/chart_machine_binding.dart';
import '../modules/Charts/Chart_Machine/views/chart_machine_view.dart';
import '../modules/Charts/Chart_ManoMeter/bindings/chart_mano_meter_binding.dart';
import '../modules/Charts/Chart_ManoMeter/views/chart_mano_meter_view.dart';
import '../modules/Charts/Chart_Misc/bindings/chart_misc_binding.dart';
import '../modules/Charts/Chart_Misc/views/chart_misc_view.dart';
import '../modules/Charts/Chart_SteamBoiler/bindings/chart_steam_boiler_binding.dart';
import '../modules/Charts/Chart_SteamBoiler/views/chart_steam_boiler_view.dart';
import '../modules/Charts/Chart_ThermoPack/bindings/chart_thermo_pack_binding.dart';
import '../modules/Charts/Chart_ThermoPack/views/chart_thermo_pack_view.dart';
import '../modules/Charts/Chart_Utility/bindings/chart_utility_binding.dart';
import '../modules/Charts/Chart_Utility/views/chart_utility_view.dart';
import '../modules/Charts/Chart_WaterQuality/bindings/chart_water_quality_binding.dart';
import '../modules/Charts/Chart_WaterQuality/views/chart_water_quality_view.dart';
import '../modules/Charts/Chart_FlueGas/views/chart_flue_gas_view.dart';
import '../modules/Charts/Chart_SupplyPump/bindings/chart_supply_pump_binding.dart';
import '../modules/Charts/Chart_SupplyPump/views/chart_supply_pump_view.dart';

import '../modules/MachineComparison/Compare_FlueGas/bindings/compare_flue_gas_binding.dart';
import '../modules/MachineComparison/Compare_FlueGas/views/compare_flue_gas_view.dart';
import '../modules/MachineComparison/Compare_GEB/bindings/compare_g_e_b_binding.dart';
import '../modules/MachineComparison/Compare_GEB/views/compare_g_e_b_view.dart';
import '../modules/MachineComparison/Compare_Machine/bindings/compare_machine_binding.dart';
import '../modules/MachineComparison/Compare_Machine/views/compare_machine_view.dart';
import '../modules/MachineComparison/Compare_ManoMeter/bindings/compare_mano_meter_binding.dart';
import '../modules/MachineComparison/Compare_ManoMeter/views/compare_mano_meter_view.dart';
import '../modules/MachineComparison/Compare_Misc/bindings/compare_misc_binding.dart';
import '../modules/MachineComparison/Compare_Misc/views/compare_misc_view.dart';
import '../modules/MachineComparison/Compare_SteamBoiler/bindings/compare_steam_boiler_binding.dart';
import '../modules/MachineComparison/Compare_SteamBoiler/views/compare_steam_boiler_view.dart';
import '../modules/MachineComparison/Compare_SupplyPump/bindings/compare_supply_pump_binding.dart';
import '../modules/MachineComparison/Compare_SupplyPump/views/compare_supply_pump_view.dart';
import '../modules/MachineComparison/Compare_ThermoPack/bindings/compare_thermo_pack_binding.dart';
import '../modules/MachineComparison/Compare_ThermoPack/views/compare_thermo_pack_view.dart';
import '../modules/MachineComparison/Compare_Utility/bindings/compare_utility_binding.dart';
import '../modules/MachineComparison/Compare_Utility/views/compare_utility_view.dart';
import '../modules/MachineComparison/Compare_WaterQuality/bindings/compare_water_quality_binding.dart';
import '../modules/MachineComparison/Compare_WaterQuality/views/compare_water_quality_view.dart';
import '../modules/MachineList/FlueGas/bindings/flue_gas_binding.dart';
import '../modules/MachineList/FlueGas/views/flue_gas_view.dart';
import '../modules/MachineList/GEB/bindings/geb_binding.dart';
import '../modules/MachineList/GEB/views/geb_view.dart';
import '../modules/MachineList/Machine/bindings/machine_binding.dart';
import '../modules/MachineList/Machine/views/machine_view.dart';
import '../modules/MachineList/MachineListTabBarNaviagtion/MachineListTabBar.dart';
import '../modules/MachineList/MachineListTabBarNaviagtion/MachineListTabBar.dart';
import '../modules/MachineList/ManoMeter/bindings/mano_meter_binding.dart';
import '../modules/MachineList/ManoMeter/views/mano_meter_view.dart';
import '../modules/MachineList/Misc/bindings/misc_binding.dart';
import '../modules/MachineList/Misc/views/misc_view.dart';
import '../modules/MachineList/SteamBoiler/bindings/steam_boiler_binding.dart';
import '../modules/MachineList/SteamBoiler/views/steam_boiler_view.dart';
import '../modules/MachineList/SupplyPump/bindings/supply_pump_binding.dart';
import '../modules/MachineList/SupplyPump/views/supply_pump_view.dart';
import '../modules/MachineList/ThermoPack/bindings/thermo_pack_binding.dart';
import '../modules/MachineList/ThermoPack/views/thermo_pack_view.dart';
import '../modules/MachineList/Utility/bindings/utility_binding.dart';
import '../modules/MachineList/Utility/views/utility_view.dart';
import '../modules/MachineList/WaterQuality/bindings/water_quality_binding.dart';
import '../modules/MachineList/WaterQuality/views/water_quality_view.dart';

import '../modules/TodayReport/Report_FlueGas/bindings/report_flue_gas_binding.dart';
import '../modules/TodayReport/Report_FlueGas/views/report_flue_gas_view.dart';
import '../modules/TodayReport/Report_GEB/bindings/report_g_e_b_binding.dart';
import '../modules/TodayReport/Report_GEB/views/report_g_e_b_view.dart';
import '../modules/TodayReport/Report_Machines/bindings/report_machines_binding.dart';
import '../modules/TodayReport/Report_Machines/views/report_machines_view.dart';
import '../modules/TodayReport/Report_ManoMeter/bindings/report_mano_meter_binding.dart';
import '../modules/TodayReport/Report_ManoMeter/views/report_mano_meter_view.dart';
import '../modules/TodayReport/Report_Misc/bindings/report_misc_binding.dart';
import '../modules/TodayReport/Report_Misc/views/report_misc_view.dart';
import '../modules/TodayReport/Report_SteamBoiler/bindings/report_steam_boiler_binding.dart';
import '../modules/TodayReport/Report_SteamBoiler/views/report_steam_boiler_view.dart';
import '../modules/TodayReport/Report_SupplyPump/bindings/report_supply_pump_binding.dart';
import '../modules/TodayReport/Report_SupplyPump/views/report_supply_pump_view.dart';
import '../modules/TodayReport/Report_ThermoPack/bindings/report_thermo_pack_binding.dart';
import '../modules/TodayReport/Report_ThermoPack/views/report_thermo_pack_view.dart';
import '../modules/TodayReport/Report_Utilty/bindings/report_utilty_binding.dart';
import '../modules/TodayReport/Report_Utilty/views/report_utilty_view.dart';
import '../modules/TodayReport/Report_WaterQuality/bindings/report_water_quality_binding.dart';
import '../modules/TodayReport/Report_WaterQuality/views/report_water_quality_view.dart';
import '../modules/UploadData/Upload_FlueGas/bindings/upload_flue_gas_binding.dart';
import '../modules/UploadData/Upload_GEB/bindings/upload_g_e_b_binding.dart';
import '../modules/UploadData/Upload_GEB/views/upload_g_e_b_view.dart';
import '../modules/UploadData/Upload_Machine/bindings/upload_machine_binding.dart';
import '../modules/UploadData/Upload_Machine/views/upload_machine_view.dart';
import '../modules/UploadData/Upload_ManoMeter/bindings/upload_mano_meter_binding.dart';
import '../modules/UploadData/Upload_ManoMeter/views/upload_mano_meter_view.dart';
import '../modules/UploadData/Upload_Misc/bindings/upload_misc_binding.dart';
import '../modules/UploadData/Upload_Misc/views/upload_misc_view.dart';
import '../modules/UploadData/Upload_SteamBoiler/bindings/upload_steam_boiler_binding.dart';
import '../modules/UploadData/Upload_SteamBoiler/views/upload_steam_boiler_view.dart';
import '../modules/UploadData/Upload_SupplyPump/bindings/upload_supply_pump_binding.dart';
import '../modules/UploadData/Upload_SupplyPump/views/upload_supply_pump_view.dart';
import '../modules/UploadData/Upload_ThermoPack/bindings/upload_thermo_pack_binding.dart';
import '../modules/UploadData/Upload_ThermoPack/views/upload_thermo_pack_view.dart';
import '../modules/UploadData/Upload_Utility/bindings/upload_utility_binding.dart';
import '../modules/UploadData/Upload_Utility/views/upload_utility_view.dart';
import '../modules/UploadData/Upload_WaterQuality/bindings/upload_water_quality_binding.dart';
import '../modules/UploadData/Upload_WaterQuality/views/upload_water_quality_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MachineListTabBar;

  static final routes = [
    GetPage(
      page: () => MachineListTabBar(),
      name: _Paths.MachineListTabBar,

    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TRANSITION,
      page: () => TransitionView(),
      binding: TransitionBinding(),
    ),

    GetPage(
      name: _Paths.SUPPLY_PUMP,
      page: () => SupplyPumpView(),
      binding: SupplyPumpBinding(),
    ),
    GetPage(
      name: _Paths.THERMO_PACK,
      page: () => ThermoPackView(),
      binding: ThermoPackBinding(),
    ),
    GetPage(
      name: _Paths.STEAM_BOILER,
      page: () => SteamBoilerView(),
      binding: SteamBoilerBinding(),
    ),
    GetPage(
      name: _Paths.MACHINE,
      page: () => MachineView(),
      binding: MachineBinding(),
    ),
    GetPage(
      name: _Paths.WATER_QUALITY,
      page: () => WaterQualityView(),
      binding: WaterQualityBinding(),
    ),
    GetPage(
      name: _Paths.GEB,
      page: () => GebView(),
      binding: GebBinding(),
    ),
    GetPage(
      name: _Paths.MANO_METER,
      page: () => ManoMeterView(),
      binding: ManoMeterBinding(),
    ),
    GetPage(
      name: _Paths.FLUE_GAS,
      page: () => FlueGasView(),
      binding: FlueGasBinding(),
    ),
    GetPage(
      name: _Paths.MISC,
      page: () => MiscView(),
      binding: MiscBinding(),
    ),
    GetPage(
      name: _Paths.UTILITY,
      page: () => UtilityView(),
      binding: UtilityBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_UTILITY,
      page: () => UploadUtilityView(),
      binding: UploadUtilityBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_STEAM_BOILER,
      page: () => UploadSteamBoilerView(),
      binding: UploadSteamBoilerBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_THERMO_PACK,
      page: () => UploadThermoPackView(),
      binding: UploadThermoPackBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_MACHINE,
      page: () => UploadMachineView(),
      binding: UploadMachineBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_WATER_QUALITY,
      page: () => UploadWaterQualityView(),
      binding: UploadWaterQualityBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_SUPPLY_PUMP,
      page: () => UploadSupplyPumpView(),
      binding: UploadSupplyPumpBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_G_E_B,
      page: () => UploadGEBView(),
      binding: UploadGEBBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_MANO_METER,
      page: () => UploadManoMeterView(),
      binding: UploadManoMeterBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_FLUE_GAS,
      page: () => UploadFlueGasView(),
      binding: UploadFlueGasBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_MISC,
      page: () => UploadMiscView(),
      binding: UploadMiscBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_UTILITY,
      page: () => CompareUtilityView(),
      binding: CompareUtilityBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_STEAM_BOILER,
      page: () => CompareSteamBoilerView(),
      binding: CompareSteamBoilerBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_THERMO_PACK,
      page: () => CompareThermoPackView(),
      binding: CompareThermoPackBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_MACHINE,
      page: () => CompareMachineView(),
      binding: CompareMachineBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_WATER_QUALITY,
      page: () => CompareWaterQualityView(),
      binding: CompareWaterQualityBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_SUPPLY_PUMP,
      page: () => CompareSupplyPumpView(),
      binding: CompareSupplyPumpBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_G_E_B,
      page: () => CompareGEBView(),
      binding: CompareGEBBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_MANO_METER,
      page: () => CompareManoMeterView(),
      binding: CompareManoMeterBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_FLUE_GAS,
      page: () => CompareFlueGasView(),
      binding: CompareFlueGasBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_MISC,
      page: () => CompareMiscView(),
      binding: CompareMiscBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_UTILTY,
      page: () => ReportUtiltyView(),
      binding: ReportUtiltyBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_STEAM_BOILER,
      page: () => ReportSteamBoilerView(),
      binding: ReportSteamBoilerBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_THERMO_PACK,
      page: () => ReportThermoPackView(),
      binding: ReportThermoPackBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_MACHINES,
      page: () => ReportMachinesView(),
      binding: ReportMachinesBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_WATER_QUALITY,
      page: () => ReportWaterQualityView(),
      binding: ReportWaterQualityBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_SUPPLY_PUMP,
      page: () => ReportSupplyPumpView(),
      binding: ReportSupplyPumpBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_G_E_B,
      page: () => ReportGEBView(),
      binding: ReportGEBBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_MANO_METER,
      page: () => ReportManoMeterView(),
      binding: ReportManoMeterBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_FLUE_GAS,
      page: () => ReportFlueGasView(),
      binding: ReportFlueGasBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_MISC,
      page: () => ReportMiscView(),
      binding: ReportMiscBinding(),
    ),
    GetPage(
      name: _Paths.CHART_UTILITY,
      page: () => ChartUtilityView(),
      binding: ChartUtilityBinding(),
    ),
    GetPage(
      name: _Paths.CHART_STEAM_BOILER,
      page: () => ChartSteamBoilerView(),
      binding: ChartSteamBoilerBinding(),
    ),
    GetPage(
      name: _Paths.CHART_THERMO_PACK,
      page: () => ChartThermoPackView(),
      binding: ChartThermoPackBinding(),
    ),
    GetPage(
      name: _Paths.CHART_MACHINE,
      page: () => ChartMachineView(),
      binding: ChartMachineBinding(),
    ),
    GetPage(
      name: _Paths.CHART_WATER_QUALITY,
      page: () => ChartWaterQualityView(),
      binding: ChartWaterQualityBinding(),
    ),
    GetPage(
      name: _Paths.CHART_SUPPLY_PUMP,
      page: () => ChartSupplyPumpView(),
      binding: ChartSupplyPumpBinding(),
    ),
    GetPage(
      name: _Paths.CHART_G_E_B,
      page: () => ChartGEBView(),
      binding: ChartGEBBinding(),
    ),
    GetPage(
      name: _Paths.CHART_MANO_METER,
      page: () => ChartManoMeterView(),
      binding: ChartManoMeterBinding(),
    ),
    GetPage(
      name: _Paths.CHART_FLUE_GAS,
      page: () => ChartFlueGasView(),
      binding: ChartFlueGasBinding(),
    ),
    GetPage(
      name: _Paths.CHART_MISC,
      page: () => ChartMiscView(),
      binding: ChartMiscBinding(),
    ),
  ];
}
