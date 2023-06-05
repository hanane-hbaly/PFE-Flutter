// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_pfe/controller/vendeur_controller/enregidtreCommandeController.dart';
// import '../../../core/class/handlingdataview.dart';

// class EnregistrerCommande extends StatelessWidget {
//   const EnregistrerCommande({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(EnregistrerCommandeController());

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[700],
//         title: const Center(child: Text("Minoterie Othman ")),
//       ),
//       drawerScrimColor: Colors.transparent,
//       body: GetBuilder<EnregistrerCommandeController>(
//         builder: (controller) => HandlingDataView(
//             statusRequest: controller.statusRequest,
//             widget: Column(children: <Widget>[
//               // DropdownButton(
//               //     //isExpanded: true,
//               //     hint: const Text("Select Client "),
//                   // value: controller.selectedValue,
//               //     items: controller.client.map((client) {
//               //       return DropdownMenuItem(
//               //         value: client['nomc'],
//               //         child: Text(client['nomc']),

//               //         // items: controller.client?.entries.map((MapEntry entry) {
//               //         //   var client = entry.value;
//               //         //   return DropdownMenuItem(
//               //         //     value: client['nomc'],
//               //         //     child: Text(client['nomc']),
//               //       );
//               //     }).toList(),
//               //     onChanged: (value) {
//               //       controller.setSelectedvalue(value);
//               //     }),

//               DropdownButton(
//                   hint: const Text("Select Client "),
//                   value: controller.selectedValue,
//                   items: controller.client != null
//                       ? controller.client.map((client) {
//                           return DropdownMenuItem(
//                             value: client['nomc'],
//                             child: Text(client['nomc']),
//                           );
//                         }).toList()
//                       : [],
//                   onChanged: (value) {
//                     controller.setSelectedvalue(value);
//                   }),

//               Text(controller.selectedValue!),
//             ])),
//       ),
//     );
//   }
// }


//   //  items: controller.client.map((client) {
//   //                   return DropdownMenuItem(
//   //                     value: client['nomc'],
//   //                     child: Text(client['nomc']),
//   //                   );
//                   // }).toList(),