// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_pfe/core/class/statusrequest.dart';
// import 'package:my_pfe/core/function/handilingdata.dart';
// import 'package:my_pfe/data/datasource/remote/adminData/planningA_data.dart';
// import 'package:intl/intl.dart';

// class PlanningController extends GetxController {
//   PlanningAData planningAData = PlanningAData(Get.find());
//   StatusRequest? statusRequest;
//   List<Map<String, dynamic>> affectation = [];
//   List<double> dataRowHeights = [];

//   DateTime startDate = DateTime.now();
//   DateTime endDate = DateTime.now();

//   @override
//   void onInit() {
//     super.onInit();
//     buildDataRowList();
//     startDate = DateTime.now();
//     endDate = DateTime.now().add(const Duration(days: 7));
//   }

//   List<DataColumn> columns = const [
//     DataColumn(label: Text('Jours')),
//     DataColumn(label: Text('Secteur')),
//     DataColumn(label: Text('Vendeur')),
//     DataColumn(label: Text('Véhicule')),
//   ];

//   void showCalendar(BuildContext context, DateTime date) {
//     showDatePicker(
//       context: context,
//       initialDate: date,
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2024),
//     ).then((selectedDate) {
//       if (selectedDate != null) {
//         startDate = selectedDate;
//         endDate = selectedDate;
//         date = selectedDate;
//         update();
//       }
//     });
//   }

//   String _getDayOfWeek(DateTime date) {
//     List<String> daysOfWeek = [
//       'Dimanche',
//       'Lundi',
//       'Mardi',
//       'Mercredi',
//       'Jeudi',
//       'Vendredi',
//       'Samedi'
//     ];
//     int dayIndex = date.weekday - 1;
//     return daysOfWeek[dayIndex];
//   }

//   double nombrecell = 0;

//   List<DataRow> buildDataRowList() {
//     final List<DataRow> dataRows = [];

//     // Grouper les affectations par jour
//     Map<DateTime, List<Map<String, dynamic>>> affectationByDay = {};

//     for (final affectationData in affectation) {
//       final date = DateTime.parse(affectationData['Datea']);

//       if (!affectationByDay.containsKey(date)) {
//         affectationByDay[date] = [];
//         nombrecell++;
//       }

//       affectationByDay[date]?.add(affectationData);
//     }

//     // Créer les DataRow pour chaque jour et ses affectations
//     affectationByDay.forEach((date, affectations) {
//       final formattedDate1 = DateFormat('yyyy/MM/dd').format(date);
//       final formattedDate = _getDayOfWeek(date);

//       List<DataCell> dataCells = [
//         DataCell(Column(
//           children: [
//             Text(" $formattedDate,"),
//             Text("  $formattedDate1 "),
//           ],
//         )),
//         DataCell(
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: affectations
//                 .map((affectation) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Text(affectation['Noms']),
//                     ))
//                 .toList(),
//           ),
//         ),
//         DataCell(
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: affectations
//                 .map((affectation) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Text(affectation['VendeurNom']),
//                     ))
//                 .toList(),
//           ),
//         ),
//         DataCell(
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: affectations
//                 .map((affectation) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Text(affectation['VehiculeID']),
//                     ))
//                 .toList(),
//           ),
//         ),
//       ];

//       dynamic rowHeight = affectations.length * 20.0;
//       dataRowHeights.add(rowHeight);

//       dataRows.add(DataRow(cells: dataCells));
//     });

//     update();

//     return dataRows;
//   }

//   List<double> buildDataRowHeights() {
//     return dataRowHeights;
//   }

//   void getAffectation() async {
//     statusRequest = StatusRequest.loading;

//     final DateFormat formatter = DateFormat('yyyy/MM/dd');
//     final String startDateText = formatter.format(startDate);
//     final String endDateText = formatter.format(endDate);

//     var response = await planningAData.getData(startDateText, endDateText);
//     statusRequest = handlingData(response);
//     print("********************** $response");

//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         affectation = List<Map<String, dynamic>>.from(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//     //buildDataRowList(); // Appeler la méthode
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pfe/core/class/statusrequest.dart';
import 'package:my_pfe/core/function/handilingdata.dart';
import 'package:my_pfe/data/datasource/remote/adminData/planningA_data.dart';
import 'package:intl/intl.dart';

class PlanningController extends GetxController {
  PlanningAData planningAData = PlanningAData(Get.find());
  StatusRequest? statusRequest;
  List<Map<String, dynamic>> affectation = [];

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  //List<DataRow> dataRows = [];
  RxList<DataRow> dataRows = RxList<DataRow>([]);
  var hasAffectations = false.obs;

  int rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int currentPage = 0;
  late MyDataTableSource dataTableSource;

  @override
  void onInit() {
    startDate = DateTime.now().subtract((const Duration(days: 7)));
    endDate = DateTime.now();
    dataTableSource = MyDataTableSource(this);
    // buildDataRowList();
    super.onInit();
  }

  List<DataColumn> columns = const [
    DataColumn(label: Text('Jours')),
    DataColumn(label: Text('Secteur')),
    DataColumn(label: Text('Vendeur')),
    DataColumn(label: Text('Véhicule')),
  ];

  void showCalendar(BuildContext context, DateTime date) {
    showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    ).then((selectedDate) {
      if (selectedDate != null) {
        startDate = selectedDate;
        endDate = selectedDate;
        date = selectedDate;
        update();
      }
    });
  }

  String _getDayOfWeek(DateTime date) {
    List<String> daysOfWeek = [
      'Dimanche',
      'Lundi',
      'Mardi',
      'Mercredi',
      'Jeudi',
      'Vendredi',
      'Samedi'
    ];
    int dayIndex = date.weekday - 1;
    return daysOfWeek[dayIndex];
  }

  void buildDataRowList(List<Map<String, dynamic>> affectation) {
    List<DataRow> newDataRows = [];
    double nombreCell = 0;

    // Grouper les affectations par jour
    Map<DateTime, List<Map<String, dynamic>>> affectationByDay = {};

    for (final affectationData in affectation) {
      final date = DateTime.parse(affectationData['Datea'])
          .add((const Duration(days: 1)));

      if (!affectationByDay.containsKey(date)) {
        affectationByDay[date] = [];
        nombreCell++;
      }

      affectationByDay[date]?.add(affectationData);
    }

    // Créer les DataRow pour chaque jour et ses affectations
    affectationByDay.forEach((date, affectations) {
      final formattedDate1 = DateFormat('yyyy/MM/dd').format(date);
      final formattedDate = _getDayOfWeek(date);

      List<DataCell> dataCells = [
        DataCell(
          SizedBox(
            height: 100 * nombreCell,
            child: Column(
              children: [
                Text(" $formattedDate, $formattedDate1"),
                Text(""),
              ],
            ),
          ),
        ),
        DataCell(
          SizedBox(
            height: 100 * nombreCell,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: affectations
                  .map((affectation) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(affectation['Noms']),
                      ))
                  .toList(),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            height: 100 * nombreCell,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: affectations
                  .map((affectation) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(affectation['VendeurNom']),
                      ))
                  .toList(),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            height: 100 * nombreCell,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: affectations
                  .map((affectation) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(affectation['VehiculeID']),
                      ))
                  .toList(),
            ),
          ),
        ),
      ];

      newDataRows.add(DataRow(cells: dataCells));
    });

    dataRows.value = newDataRows;
  }

  void getAffectation() async {
    statusRequest = StatusRequest.loading;

    final DateFormat formatter = DateFormat('yyyy/MM/dd');
    final String startDateText = formatter.format(startDate);
    final String endDateText = formatter.format(endDate);
    //update();
    var response = await planningAData.getData(startDateText, endDateText);
    statusRequest = handlingData(response);
    print("********************** $response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        affectation = List<Map<String, dynamic>>.from(response['data']);
        buildDataRowList(affectation);
        hasAffectations.value = (affectation.isNotEmpty);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void onRowsPerPageChanged(int? newRowsPerPage) {
    rowsPerPage = newRowsPerPage ?? 0;
    currentPage = 0;
    buildDataRowList(affectation);
    //update();
    print(' vvvvvvvvvvvvvvvvvvvvvvvv $rowsPerPage');
  }
}

class MyDataTableSource extends DataTableSource {
  final PlanningController controller;

  MyDataTableSource(this.controller);

  @override
  DataRow? getRow(int index) {
    if (index >= controller.dataRows.length) {
      return null;
    }
    return controller.dataRows[index];
  }

  @override
  int get rowCount => controller.dataRows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
