import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/report_utilty_controller.dart';

class ReportUtiltyView extends GetView<ReportUtiltyController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ReportUtiltyController());
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    controller.chooseDate();
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_sharp,
                        color: Color(0xFF6EB7A1),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Obx(()=>
                            Text(
                              DateFormat("dd-MM-yyyy")
                                  .format(controller.selectedDate.value)
                                  .toString(),
                              style: const TextStyle(
                                color: Color(0xFF848484),
                              ),
                            ),
                          )),
                      const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Color(0xFF6EB7A1),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFE1DFDD),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'SMS',
                      style: TextStyle(
                        color: Color(0xFF848484),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFE1DFDD),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'E-Mail',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF848484),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Center(
                        child: Column(
                          children: [
                            _createDataTable2(),
                            _createDataTable3(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

DataTable _createDataTable2() {
  return DataTable(
      columns: _createColumns2(),
      rows: _createRows2(),
      headingRowColor: MaterialStateProperty.resolveWith(
              (states) => const Color(0xFF716259)));
}

List<DataColumn> _createColumns2() {
  return [
    const DataColumn(label: Text('Name ')),
    const DataColumn(label: Text('em')),
    const DataColumn(label: Text('EM/HM')),
    const DataColumn(label: Text('%')),
  ];
}

List<DataRow> _createRows2() {
  var row = 1;
  return [
    DataRow.byIndex(
        index: row,
        color: MaterialStateColor.resolveWith(
              (states) {
            if (row == 1) {
              return const Color(0xFFF1F1F1);
            } else {
              return Colors.white;
            }
          },
        ),
        cells: const [
          DataCell(Text('Jet')),
          DataCell(Text('EM')),
          DataCell(Text('HM')),
          DataCell(Text('%'))
        ]),
    const DataRow(cells: [
      DataCell(Text('Name')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ]),
    const DataRow(cells: [
      DataCell(Text('Name')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ]),
    const DataRow(cells: [
      DataCell(Text('Name')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ]),
    const DataRow(cells: [
      DataCell(Text('Name')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ]),
    const DataRow(cells: [
      DataCell(Text('Name')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ]),
    const DataRow(cells: [
      DataCell(Text('Name')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ])
  ];
}

DataTable _createDataTable3() {
  return DataTable(
      columns: _createColumns3(),
      rows: _createRows3(),
      headingRowColor: MaterialStateProperty.resolveWith(
              (states) => const Color(0xFFF1F1F1)));
}

List<DataColumn> _createColumns3() {
  return [
    const DataColumn(label: Text('Jet')),
    const DataColumn(label: Text('EM')),
    const DataColumn(label: Text('EM/HM')),
    const DataColumn(label: Text('%')),
  ];
}

List<DataRow> _createRows3() {
  return [
    const DataRow(cells: [
      DataCell(Text('Jet')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ]),
    const DataRow(cells: [
      DataCell(Text('Aame')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ]),
    const DataRow(cells: [
      DataCell(Text('Name')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ]),
    const DataRow(cells: [
      DataCell(Text('Name')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ]),
    const DataRow(cells: [
      DataCell(Text('Name')),
      DataCell(Text('0')),
      DataCell(Text('0')),
      DataCell(Text('0'))
    ])
  ];
}

