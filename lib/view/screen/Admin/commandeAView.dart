// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_pfe/controller/admin_controller/CommandeAController.dart';

// class CommandeAView extends StatelessWidget {
//   final CommandeController commandeController = Get.put(CommandeController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Consulter les commandes'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             GetBuilder<CommandeController>(
//               builder: (controller) {
//                 return DropdownButton<String>(
//                   value: controller.selectedVendeur.value.isNotEmpty
//                       ? controller.selectedVendeur.value
//                       : '',
//                   onChanged: (value) {
//                     controller.selectedVendeur.value = value!;
//                   },
//                   items: controller.vendeurs.toList().map((vendeur) {
//                     //  items: controller.vendeurs.map((vendeur) {

//                     return DropdownMenuItem<String>(
//                       value: vendeur,
//                       child: Text(vendeur),
//                     );
//                   }).toList(),
//                   hint: const Text('Sélectionner un vendeur'),
//                 );
//               },
//             ),

// GetBuilder<CommandeController>(
//   builder: (controller) {
//     List<String> uniqueVendeurs =
//         controller.vendeurs.toSet().toList();
//     return Obx(() => DropdownButton<String>(
//           value: controller.selectedVendeur.value,
//           onChanged: (value) {
//             controller.selectedVendeur.value = value!;
//           },
//           items: uniqueVendeurs.map((vendeur) {
//             return DropdownMenuItem<String>(
//               value: vendeur,
//               child: Text(vendeur),
//             );
//           }).toList(),
//           hint: Text('Sélectionner un vendeur'),
//         ));
//   },
// ),
//             SizedBox(height: 16.0),
//             GetBuilder<CommandeController>(
//               builder: (controller) {
//                 return TextButton(
//                   onPressed: () async {
//                     final pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: controller.selectedDate.value,
//                       firstDate: DateTime(2023),
//                       lastDate: DateTime(2024),
//                     );
//                     if (pickedDate != null) {
//                       controller.selectedDate.value = pickedDate;
//                     }
//                   },
//                   child: Text('Sélectionner une date'),
//                 );
//               },
//             ),
//             SizedBox(height: 16.0),
//             GetBuilder<CommandeController>(
//               builder: (controller) {
//                 return ElevatedButton(
//                   onPressed: () {
//                     controller.fetchCommandes();
//                     print(controller.commandes);
//                   },
//                   child: Text('Consulter'),
//                 );
//               },
//             ),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: GetBuilder<CommandeController>(
//                 builder: (controller) {
//                   return ListView.builder(
//                     itemCount: controller.commandes.length,
//                     itemBuilder: (context, index) {
//                       final commande = controller.commandes[index];
//                       return ListTile(
//                         title: Text(commande.client),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(commande.adresse),
//                             Text(commande.produits),
//                             Text('Prix de commande: ${commande.prixCommande}'),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             GetBuilder<CommandeController>(
//               builder: (controller) {
//                 return Text(
//                   'Véhicule: ${controller.vehiculeID.value}\n'
//                   'Tonnage de départ: ${controller.tonnageDepart.value}\n'
//                   'Tonnage d\'arrivée: ${controller.tonnageArrivee.value}\n'
//                   'Prix total: ${controller.prixTotal.value}',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// GetBuilder<CommandeController>(
//   builder: (controller) {
//     return DropdownButton<String>(
//       value: controller.selectedVendeur.value,
//       onChanged: (value) {
//         controller.selectedVendeur.value = value!;
//       },
//       items: controller.vendeurs.map((vendeur) {
//         return DropdownMenuItem<String>(
//           value: vendeur,
//           child: Text(vendeur),
//         );
//       }).toList(),
//       hint: Text('Sélectionner un vendeur'),
//     );
//   },
// ),

//2 GetBuilder<CommandeController>(
//   builder: (controller) {
//     return DropdownButton<String>(
//       value: controller.selectedVendeur.value,
//       onChanged: (value) {
//         controller.selectedVendeur.value = value!;
//       },
//       items: controller.vendeurs.map((vendeur) {
//         return DropdownMenuItem<String>(
//           value: vendeur,
//           child: Text(vendeur),
//         );
//       }).toList(),
//       hint: Text('Sélectionner un vendeur'),
//     );
//   },
// ),

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:my_pfe/core/constant/linkapi.dart';

// class CommandeAView extends StatefulWidget {
//   @override
//   _CommandeAViewState createState() => _CommandeAViewState();
// }

// class _CommandeAViewState extends State<CommandeAView> {
//   List<String> vendeurs = [];
//   String selectedVendeur = '';
//   DateTime selectedDate = DateTime.now();
//   List<dynamic> commandes = [];

//   // @override
//   // initstate est ce que j'ai besoin de initstate ici
//   Future<void> fetchVendeurs() async {
//     final response = await http.get(Uri.parse(AppLink.getAllVS));
//     final data = jsonDecode(response.body);
//     if (data['status'] == 'success') {
//       setState(() {
//         vendeurs = List<String>.from(data['data'].toSet().toList());
//       });
//     }
//   }

//   Future<void> fetchCommandes() async {
//     final response = await http.get(Uri.parse(AppLink.getAllcommandA));
//     final data = jsonDecode(response.body);
//     setState(() {
//       commandes = data;
//     });
//   }

//   List<DataRow> buildDataRows() {
//     List<DataRow> dataRows = [];
//     for (var commande in commandes) {
//       String client = commande['client'];
//       String adresseClient = commande['Adressec'];
//       String produits = commande['produits'];
//       double prixCommande = commande['prixCommande'];

//       dataRows.add(DataRow(
//         cells: [
//           DataCell(Text(client)),
//           DataCell(Text(adresseClient)),
//           DataCell(Text(produits)),
//           DataCell(Text(prixCommande.toString())),
//         ],
//       ));
//     }
//     return dataRows;
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchVendeurs();
//     fetchCommandes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String selectedVendeur = vendeurs.isNotEmpty ? vendeurs[0] : '';
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Consultation des commandes'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               DropdownButton<String>(
//                 value: selectedVendeur,
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedVendeur = newValue!;
//                   });
//                 },
//                 items: vendeurs.map((vendeur) {
//                   return DropdownMenuItem<String>(
//                     value: vendeur,
//                     child: Text(vendeur),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () async {
//                   await fetchCommandes();
//                   // Filtrer les commandes du vendeur sélectionné à la date choisie
//                   List<dynamic> filteredCommandes = commandes.where((commande) {
//                     // Votre logique de filtrage ici
//                     // Comparer le vendeur et la date
//                     return commande['client'] == selectedVendeur &&
//                         // Assurez-vous que la date de la commande est égale à la date sélectionnée
//                         DateTime.parse(commande['date'])
//                             .isAtSameMomentAs(selectedDate);
//                   }).toList();

//                   setState(() {
//                     commandes = filteredCommandes;
//                   });
//                 },
//                 child: Text('Consulter'),
//               ),
//               SizedBox(height: 10),
//               Text('Sélectionnez une date:'),
//               ElevatedButton(
//                 onPressed: () async {
//                   final DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: selectedDate,
//                     firstDate: DateTime(2021),
//                     lastDate: DateTime.now(),
//                   );
//                   if (pickedDate != null) {
//                     setState(() {
//                       selectedDate = pickedDate;
//                     });
//                   }
//                 },
//                 child: Text('Choisir une date'),
//               ),
//               SizedBox(height: 20),
//               DataTable(
//                 columns: [
//                   DataColumn(label: Text('Client')),
//                   DataColumn(label: Text('Adresse')),
//                   DataColumn(label: Text('Produits')),
//                   DataColumn(label: Text('Prix')),
//                 ],
//                 rows: buildDataRows(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_pfe/controller/admin_controller/CommandeAController.dart';
import 'package:provider/provider.dart';

//View
class CommandeAView extends StatelessWidget {
  final CommandeController commandeController = CommandeController();

  CommandeAView({super.key});

  @override
  Widget build(BuildContext context) {
    commandeController.selectedVendeur = commandeController.vendeurs.isNotEmpty
        ? commandeController.vendeurs.first
        : '';
    return ChangeNotifierProvider(
      create: (context) => commandeController,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Consultation des commandes'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Dropdown pour sélectionner le vendeur
              FutureBuilder(
                future: commandeController.getAllVendeurs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Erreur lors du chargement des vendeurs.');
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DropdownButton(
                        hint: const Text('Vendeurs'),
                        value: commandeController.selectedVendeur,
                        items: commandeController.vendeurs.map((vendeur) {
                          return DropdownMenuItem(
                            value: vendeur,
                            child: Text(vendeur),
                          );
                        }).toList(),
                        onChanged: (value) {
                          //commandeController.selectedVendeur = value.toString();
                          commandeController
                              .updateSelectedVendeur(value.toString());
                        },
                      ),
                    );
                  }
                },
              ),
              // Sélection de la date
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (selectedDate != null) {
                      commandeController.selectedDate = selectedDate;
                    }
                  },
                  child: const Text('Sélectionner une date'),
                ),
              ),
              // Bouton pour consulter les commandes
              Expanded(
                child: Consumer<CommandeController>(
                  builder: (context, controller, _) {
                    if (controller.isLoading) {
                      return const CircularProgressIndicator();
                    } else if (controller.errorMessage.isNotEmpty) {
                      return Text(controller.errorMessage);
                    } else {
                      return ListView.builder(
                        itemCount: controller.commandes.length,
                        itemBuilder: (context, index) {
                          final commande = controller.commandes[index];
                          return ListTile(
                            title: Text(commande.client),
                            subtitle: Text(commande.adresse),
                            trailing: Text(
                                '${commande.prixCommande.toStringAsFixed(2)} \$'),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Détails de la commande'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Produits:'),
                                          Text(commande.produits),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Fermer'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
