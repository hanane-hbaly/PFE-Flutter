import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_pfe/controller/admin_controller/planning_controller.dart';

class PlanningView extends StatefulWidget {
  const PlanningView({super.key});

  @override
  _PlanningViewState createState() => _PlanningViewState();
}

class _PlanningViewState extends State<PlanningView> {
  @override
  Widget build(BuildContext context) {
    PlanningController controller = Get.put(PlanningController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 167, 12),
        title: const Center(child: Text('Planning d\'affectation')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Expanded(  child:

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: controller.startDate,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2054),
                    ).then((date) {
                      if (date != null) {
                        setState(() {
                          controller.startDate = date;
                        });
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                          'Début : ${DateFormat('yyyy/MM/dd').format(controller.startDate)}'),
                      const Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: controller.endDate,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2055),
                    ).then((date) {
                      if (date != null) {
                        setState(() {
                          controller.endDate = date;
                        });
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                          'Fin  : ${DateFormat('yyyy/MM/dd').format(controller.endDate)}'), // Mettez à jour le texte avec la date sélectionnée
                      const Icon(
                        Icons.calendar_today_rounded,
                        color: Color.fromARGB(255, 11, 11, 11),
                      ),
                    ],
                  ),
                ),

                // ElevatedButton(
                //   style: ButtonStyle(
                //     backgroundColor:
                //         MaterialStateProperty.all<Color>(Colors.green),
                //   ),
                //   onPressed: () {
                //     controller.showCalendar(context, controller.startDate);
                //   },
                //   child: Row(
                //     children: [
                //       //  setState(() {
                //       Text(
                //           'Début : ${DateFormat('yyyy/MM/dd').format(controller.startDate)}'),
                //       // }),

                //       const Icon(
                //         Icons.calendar_today_rounded,
                //         color: Colors.black,
                //       )
                //     ],
                //   ),
                // ),

                //),

                // Expanded(  child:
                // ElevatedButton(
                //   style: ButtonStyle(
                //     backgroundColor:
                //         MaterialStateProperty.all<Color>(Colors.green),
                //   ),
                //   onPressed: () {
                //     controller.showCalendar(context, controller.endDate);
                //   },
                //   child: Row(
                //     children: [
                //       Text(
                //           'Fin  : ${DateFormat('yyyy/MM/dd').format(controller.endDate)}'),
                //       Icon(
                //         Icons.calendar_today_rounded,
                //         color: Color.fromARGB(255, 11, 11, 11),
                //       ),
                //     ],
                //   ),
                // ),
                // ),
              ],
            ),
            //  Expanded( child:
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                controller.getAffectation();
              },
              child: const Text('Charger les affectations'),
            ),
            // ),
            const SizedBox(height: 20.0),
            Expanded(
              child: GetBuilder<PlanningController>(
                builder: (_) => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataRowMinHeight: 100,
                      dataRowMaxHeight: 130,
                      horizontalMargin: 50,
                      border: TableBorder.all(),
                      columns: controller.columns,
                      rows: controller.buildDataRowList(),
                    ),
                  ),
                ),
              ),
            )

            // Expanded(
            //   child: Obx(
            //     () => SingleChildScrollView(
            //       scrollDirection: Axis.vertical,
            //       child: SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: DataTable(
            //           border: TableBorder.all(),
            //           columns: controller.columns,
            //           rows: List<DataRow>.generate(
            //             controller.dataTableSource
            //                 .rowCount, // Utilisez rowCount pour obtenir le nombre total de lignes
            //             (index) => controller.dataTableSource.getRow(
            //                 index), // Utilisez getRow avec l'index pour obtenir chaque ligne de données
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
 
    // Expanded(
    //           child: GetBuilder<PlanningController>(
    //             builder: (_) => SingleChildScrollView(
    //               scrollDirection: Axis.vertical,
    //               child: SingleChildScrollView(
    //                 scrollDirection: Axis.horizontal,
    //                 child: Table(
    //                   border: TableBorder.all(),
    //                   columnWidths: const {
    //                     0: FlexColumnWidth(),
    //                     1: FlexColumnWidth(),
    //                     2: FlexColumnWidth(),
    //                     3: FlexColumnWidth(),
    //                   },
    //                   children: [
    //                     for (final dataRow in controller.buildDataRowList())
    //                       TableRow(
    //                         children: dataRow.cells.map((cell) {
    //                           return TableCell(
    //                             verticalAlignment:
    //                                 TableCellVerticalAlignment.middle,
    //                             child: Padding(
    //                               padding: const EdgeInsets.symmetric(
    //                                   vertical: 5.0, horizontal: 8.0),
    //                               child: cell.child,
    //                             ),
    //                           );
    //                         }).toList(),
    //                       ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),