// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_pfe/core/class/statusrequest.dart';
// import 'package:my_pfe/core/function/handilingdata.dart';
// import 'package:my_pfe/data/datasource/remote/adminData/planningA_data.dart';
// import 'package:intl/intl.dart';

// class PlanningController extends GetxController {
//   PlanningAData planningAData = (PlanningAData(Get.find()));
//   StatusRequest? statusRequest;
//   List affectation = [];

//   DateTime startDate = DateTime.now();
//   DateTime endDate = DateTime.now();
//   @override
//   void onInit() {
//     super.onInit();
//     getAffectation();
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
//     int dayIndex = date.weekday;
//     return daysOfWeek[dayIndex - 1];
//   }

//   List<DataRow> buildDataRowList() {
//     final List<DataRow> dataRows = [];

//     for (final affectation in affectation) {
//       final date = DateTime.parse(affectation['Datea']);
//       final formattedDate1 = DateFormat('yyyy/MM/dd').format(date);
//       final formattedDate = _getDayOfWeek(date);

//       List<DataCell> dataCells = [
//         DataCell(Text(" $formattedDate, $formattedDate1 ")),
//         DataCell(Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5.0),
//               child: Text(affectation['Noms']),
//             ),
//           ],
//         )),
//         DataCell(Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5.0),
//               child: Text(affectation['VendeurNom']),
//             ),
//           ],
//         )),
//         DataCell(Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5.0),
//               child: Text(affectation['VehiculeID']),
//             ),
//           ],
//         )),
//       ];

//       dataRows.add(DataRow(cells: dataCells));
//     }

//     return dataRows;
//   }

//   // getAffectation() async {
//   //   statusRequest = StatusRequest.loading;
//   //   var response = await planningAData.getData(startDate, endDate);
//   //   statusRequest = handlingData(response);
//   //   print("********************** $response");

//   //   if (StatusRequest.success == statusRequest) {
//   //     if (response['status'] == "success") {
//   //       affectation.addAll(response['data']);
//   //     } else {
//   //       statusRequest = StatusRequest.failure;
//   //     }
//   //   }
//   //   update();

//   // }
//   getAffectation() async {
//     statusRequest = StatusRequest.loading;

//     // Convertir les dates en format texte
//     final DateFormat formatter = DateFormat('yyyy/MM/dd');
//     final String startDateText = formatter.format(startDate);
//     final String endDateText = formatter.format(endDate);

//     var response = await planningAData.getData(startDateText, endDateText);
//     statusRequest = handlingData(response);
//     print("********************** $response");

//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         affectation.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
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
  //RxList<Map<String, dynamic>> affectation = RxList<Map<String, dynamic>>();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  void onInit() {
    super.onInit();

    buildDataRowList();
    startDate = DateTime.now();
    endDate = DateTime.now().add(const Duration(days: 7));
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

  //
  // void showCalendar(BuildContext context, TextEditingController controller) {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2023),
  //     lastDate: DateTime(2024),
  //   ).then((selectedDate) {
  //     if (selectedDate != null) {
  //       controller.text = DateFormat('yyyy/MM/dd').format(selectedDate);
  //       // Vous pouvez également stocker la valeur sélectionnée dans une variable d'état si nécessaire
  //     }
  //   });
  // }

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
    int dayIndex = date.weekday;
    return daysOfWeek[dayIndex - 0];
  }

  List<DataRow> buildDataRowList() {
    final List<DataRow> dataRows = [];

    // Grouper les affectations par jour
    Map<DateTime, List<Map<String, dynamic>>> affectationByDay = {};

    for (final affectationData in affectation) {
      final date = DateTime.parse(affectationData['Datea']);

      if (!affectationByDay.containsKey(date)) {
        affectationByDay[date] = [];
      }

      affectationByDay[date]?.add(affectationData);
    }

    // Créer les DataRow pour chaque jour et ses affectations
    affectationByDay.forEach((date, affectations) {
      final formattedDate1 = DateFormat('yyyy/MM/dd').format(date);
      final formattedDate = _getDayOfWeek(date);

      List<DataCell> dataCells = [
        DataCell(Text(" $formattedDate, $formattedDate1 ")),
        DataCell(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: affectations
              .map((affectation) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(affectation['Noms']),
                  ))
              .toList(),
        )),
        DataCell(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: affectations
              .map((affectation) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(affectation['VendeurNom']),
                  ))
              .toList(),
        )),
        DataCell(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: affectations
              .map((affectation) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(affectation['VehiculeID']),
                  ))
              .toList(),
        )),
      ];

      dataRows.add(DataRow(cells: dataCells));
    });

    update();

    return dataRows;
  }

  // RxList<DataRow> buildDataRowList() {
  //   final List<DataRow> dataRows = [];

  //   // Grouper les affectations par jour
  //   Map<DateTime, List<Map<String, dynamic>>> affectationByDay = {};

  //   for (final affectationData in affectation) {
  //     final date = DateTime.parse(affectationData['Datea']);

  //     if (!affectationByDay.containsKey(date)) {
  //       affectationByDay[date] = [];
  //     }

  //     affectationByDay[date]?.add(affectationData);
  //   }

  //   affectationByDay.forEach((date, affectations) {
  //     final formattedDate1 = DateFormat('yyyy/MM/dd').format(date);
  //     final formattedDate = _getDayOfWeek(date);

  //     List<DataCell> dataCells = [
  //       DataCell(Text(" $formattedDate, $formattedDate1 ")),
  //       DataCell(Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: affectations
  //             .map((affectation) => Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 5.0),
  //                   child: Text(affectation['Noms']),
  //                 ))
  //             .toList(),
  //       )),
  //       DataCell(Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: affectations
  //             .map((affectation) => Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 5.0),
  //                   child: Text(affectation['VendeurNom']),
  //                 ))
  //             .toList(),
  //       )),
  //       DataCell(Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: affectations
  //             .map((affectation) => Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 5.0),
  //                   child: Text(affectation['VehiculeID']),
  //                 ))
  //             .toList(),
  //       )),
  //     ];

  //     dataRows.add(DataRow(cells: dataCells));
  //   });

  //   return dataRows.obs;
  // }

  // List<DataRow> buildDataRowList() {
  //   final List<DataRow> dataRows = [];

  //   // Grouper les affectations par jour
  //   Map<DateTime, List> affectationByDay = {};

  //   for (final affectationData in affectation) {
  //     final date = DateTime.parse(affectationData['Datea']);
  //     // final formattedDate1 = DateFormat('yyyy/MM/dd').format(date);
  //     // final formattedDate = _getDayOfWeek(date);

  //     if (!affectationByDay.containsKey(date)) {
  //       affectationByDay[date] = [];
  //     }

  //     affectationByDay[date]?.add(affectation);
  //   }

  //   // Créer les DataRow pour chaque jour et ses affectations
  //   affectationByDay.forEach((date, affectations) {
  //     final formattedDate1 = DateFormat('yyyy/MM/dd').format(date);
  //     final formattedDate = _getDayOfWeek(date);

  //     List<DataCell> dataCells = [
  //       DataCell(Text(" $formattedDate, $formattedDate1 ")),
  //       DataCell(Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: affectations
  //             .map((affectation) => Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 5.0),
  //                   child: Text(affectation['Noms']),
  //                 ))
  //             .toList(),
  //       )),
  //       DataCell(Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: affectations
  //             .map((affectation) => Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                       vertical: 5.0), // Espacement vertical
  //                   child: Text(affectation['VendeurNom']),
  //                 ))
  //             .toList(),
  //       )),
  //       DataCell(Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: affectations
  //             .map((affectation) => Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                       vertical: 5.0), // Espacement vertical
  //                   child: Text(affectation['VehiculeID']),
  //                 ))
  //             .toList(),
  //       )),
  //     ];

  //     dataRows.add(DataRow(cells: dataCells));
  //   });

  //   return dataRows;
  // }

  // DataCell(Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 5.0),
  //       child: Text(affectationData['Noms']),
  //     ),
  //   ],
  // )),
  // DataCell(Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 5.0),
  //       child: Text(affectationData['VendeurNom']),
  //     ),
  //   ],
  // )),
  // DataCell(Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 5.0),
  //       child: Text(affectationData['VehiculeID']),
  //     ),
  //   ],
  // )),

  void getAffectation() async {
    statusRequest = StatusRequest.loading;

    final DateFormat formatter = DateFormat('yyyy/MM/dd');
    final String startDateText = formatter.format(startDate);
    final String endDateText = formatter.format(endDate);

    var response = await planningAData.getData(startDateText, endDateText);
    statusRequest = handlingData(response);
    print("********************** $response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        affectation = List<Map<String, dynamic>>.from(response['data']);

        // affectation
        //     .assignAll(List<Map<String, dynamic>>.from(response['data']));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    //buildDataRowList(); // Appeler la méthode
  }
}
