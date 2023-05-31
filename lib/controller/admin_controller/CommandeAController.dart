// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:my_pfe/core/constant/linkapi.dart';

// class CommandeController extends GetxController {
//   var vendeurs = <String>[];
//   var selectedVendeur = ''.obs;
//   var selectedDate = DateTime.now().obs;
//   var commandes = <Commande>[].obs;
//   var vehiculeID = ''.obs;
//   var tonnageDepart = 0.obs;
//   var tonnageArrivee = 0.obs;
//   var prixTotal = 0.0.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchVendeurs();
//   }

//   CommandeController() {
//     if (vendeurs.isNotEmpty) {
//       selectedVendeur.value = vendeurs[0];
//     }
//   }

//   fetchVendeurs() async {
//     try {
//       final response = await http.get(Uri.parse(AppLink.getAllVS));
//       final data = json.decode(response.body);
//       if (data['status'] == 'success') {
//         // vendeurs = data['data'];
//         List<dynamic> vendData = data['data'];
//         List<String> vendList = vendData.cast<String>();

//         vendeurs.assignAll(vendList);
//         print('la listes des vendeurs $vendeurs');
//         update();
//       } else {
//         print('erreuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuue');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void fetchCommandes() async {
//     try {
//       final response = await http.get(Uri.parse(
//           '${AppLink.getAllcommandA}?vendeur=${selectedVendeur.value}&date=${selectedDate.value.toString()}'));
//       final data = json.decode(response.body);

//       if (data.containsKey('error')) {
//         commandes.clear();
//         vehiculeID.value = '';
//         tonnageDepart.value = 0;
//         tonnageArrivee.value = 0;
//         prixTotal.value = 0.0;
//       } else {
//         commandes.value = List.from(data.values.map((item) => Commande(
//               client: item['client'],
//               adresse: item['Adressec'],
//               produits: item['produits'],
//               prixCommande: item['prixCommande'],
//               secteur: item['secteur'],
//             )));

//         vehiculeID.value = data['vehiculeID'];
//         tonnageDepart.value = data['tonageDepart'];
//         tonnageArrivee.value = data['tonageArrivee'];
//         prixTotal.value = data['prix_total'];
//       }
//     } catch (e) {
//       // Gérer les erreurs de connexion
//     }
//   }
// }

// class Commande {
//   final String client;
//   final String adresse;
//   final String produits;
//   final double prixCommande;
//   final String secteur;

//   Commande({
//     required this.client,
//     required this.adresse,
//     required this.produits,
//     required this.prixCommande,
//     required this.secteur,
//   });
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_pfe/core/constant/linkapi.dart';

class Commande {
  final String client;
  final String adresse;
  final String produits;
  final double prixCommande;

  Commande(
      {required this.client,
      required this.adresse,
      required this.produits,
      required this.prixCommande});
}

class CommandeController extends ChangeNotifier {
  List<String> vendeurs = [];
  String selectedVendeur = '';
  DateTime selectedDate = DateTime.now();
  List<Commande> commandes = [];
  bool isLoading = false;
  String errorMessage = '';

  void updateSelectedVendeur(String value) {
    selectedVendeur = value;
    notifyListeners(); // Utilisez notifyListeners() pour informer les auditeurs du changement
  }

  Future<void> getAllVendeurs() async {
    final response = await http.get(Uri.parse(AppLink.getAllVS));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      vendeurs = List<String>.from(data['data']);
      print('la listes des vendeurs  $vendeurs');
    } else {
      vendeurs = [];
      errorMessage = 'Erreur lors de la récupération des vendeurs.';
    }
    notifyListeners();
  }

  Future<void> fetchCommandes() async {
    isLoading = true;
    commandes = [];
    errorMessage = '';
    final response = await http.post(Uri.parse(AppLink.getAllcommandA), body: {
      'vendeur': selectedVendeur,
      'date': selectedDate.toString(),
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.containsKey('error')) {
        errorMessage = data['error'];
      } else {
        final commandeData = data as Map<String, dynamic>;
        final vehiculeID = commandeData['vehiculeID'];
        final tonnageDepart = commandeData['tonageDepart'];
        final tonnageArrivee = commandeData['tonageArrivee'];
        final prixTotal = commandeData['prix_total'];
        final commandesData = commandeData.values
            .whereType<Map<String, dynamic>>()
            .cast<Map<String, dynamic>>()
            .toList();

        commandes = commandesData.map((commande) {
          return Commande(
            client: commande['client'],
            adresse: commande['Adressec'],
            produits: commande['produits'],
            prixCommande: commande['prixCommande'].toDouble(),
          );
        }).toList();

        // Affichage des informations générales des commandes
        print('Véhicule ID: $vehiculeID');
        print('Tonnage Départ: $tonnageDepart');
        print('Tonnage Arrivée: $tonnageArrivee');
        print('Prix Total: $prixTotal');
      }
    } else {
      errorMessage = 'Erreur lors de la récupération des commandes.';
    }
    isLoading = false;
    notifyListeners();
  }
}
