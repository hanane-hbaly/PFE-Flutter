//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pfe/core/constant/linkapi.dart';
import 'package:my_pfe/core/constant/routes.dart';

import '../../../controller/vendeur_controller/home_controllerV.dart';
//import 'package:my_pfe/view/screen/auth/logoauth.dart';

class NavBarVendeur extends StatelessWidget {
  const NavBarVendeur({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerV controller = Get.put(HomeControllerV());
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        // UserAccountsDrawerHeader(
        //   accountName: const Text(''),
        //   accountEmail: Text("${controller.vendeur['Prenomv']}"),
        //   decoration: const BoxDecoration(
        //     color: Colors.green,
        //   ),
        //   currentAccountPicture: SizedBox(
        //     width: 150, // Ajustez la largeur souhaitée
        //     // height: 100, // Ajustez la hauteur souhaitée
        //     child: CircleAvatar(
        //       backgroundImage: NetworkImage(
        //         '${AppLink.imageUsers}/${controller.vendeur['imageU']}',
        //       ),
        //       radius: 100,
        //     ),
        //   ),
        // ),
        Center(
          child: UserAccountsDrawerHeader(
            accountName: const Text('Vendeur'),
            accountEmail: Text("${controller.vendeur['Nomv']}"),
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            currentAccountPicture: ClipOval(
              child: Image.network(
                '${AppLink.imageUsers}/${controller.vendeur['imageU']}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        ListTile(
          leading: Icon(Icons.calendar_today, color: Colors.green[800]),
          title: const Text("consulter planing"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart, color: Colors.green[800]),
          title: const Text("Enregistrer commande"),
          onTap: () {
            Get.toNamed(AppRoute.enregistrerCommande);
          },
        ),
        ListTile(
          leading: Icon(Icons.person_add, color: Colors.green[800]),
          title: const Text("Ajouter Client"),
          onTap: () {
            Get.toNamed(AppRoute.clientRegistrationPage);
          },
        ),
        ListTile(
          leading: Icon(Icons.add_box, color: Colors.green[800]),
          title: const Text("Saisi commande"),
          onTap: () {},
        ),
        const Divider(thickness: 2),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.green[800]),
          title: const Text("Log out"),
          onTap: () {},
        ),
      ]),
    );
  }
}
