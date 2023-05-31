//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pfe/core/constant/routes.dart';
//import 'package:my_pfe/view/screen/auth/logoauth.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const UserAccountsDrawerHeader(
          accountName: Text(''),
          accountEmail: Text(''),
          decoration: BoxDecoration(color: Colors.green),
        ),
        ExpansionTile(
          leading: Icon(
            Icons.person,
            color: Colors.green[800],
          ),
          iconColor: Colors.green[800],
          title: Text(
            'Ajouter Employer',
            style: TextStyle(color: Colors.green[800]),
          ),
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.green[800],
              ),
              title: const Text('Ajouter Vendeur'),
              onTap: () {
                Get.toNamed(AppRoute.ajoutervendeur);
              },
            ),
            ListTile(
              leading: Icon(Icons.add, color: Colors.green[800]),
              title: const Text('Ajouter Responsable'),
              onTap: () {
                Get.toNamed(AppRoute.ajouterrespo);
              },
            ),
          ],
        ),
        // ExpansionTile(
        //   leading: const Icon(Icons.block),
        //   title: const Text('Bloquer Employer'),
        //   children: <Widget>[
        ListTile(
          leading: Icon(Icons.block, color: Colors.green[800]),
          title: const Text('Gestion de Blocage '),
          onTap: () {
            Get.toNamed(AppRoute.bloquervendeur);
          },
        ),
        //     ListTile(
        //       //  leading: Icon(//tu peut trouver icon le plus coresspond),
        //       title: const Text('Bloquer Responsable'),
        //       onTap: () {},
        //     ),
        //   ],
        // ),
        ListTile(
          leading: Icon(Icons.business, color: Colors.green[800]),
          title: const Text("Affectation des Secteurs"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart, color: Colors.green[800]),
          title: const Text("consulter commande"),
          onTap: () {
            Get.toNamed(AppRoute.commandeAView);
          },
        ),
        ListTile(
          leading: Icon(Icons.calendar_today, color: Colors.green[800]),
          title: const Text("consulter planing"),
          onTap: () {
            Get.toNamed(AppRoute.planningView);
          },
        ),
        ListTile(
          leading: Icon(Icons.add_box, color: Colors.green[800]),
          title: const Text("Produits"),
          onTap: () {
            Get.toNamed(AppRoute.produitAView);
          },
        ),
        ListTile(
          leading: Icon(Icons.add_box, color: Colors.green[800]),
          title: const Text("Ajouter Secteur"),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.green[800]),
          title: const Text("Log out"),
          onTap: () {},
        ),
      ]),
    );
  }
}
