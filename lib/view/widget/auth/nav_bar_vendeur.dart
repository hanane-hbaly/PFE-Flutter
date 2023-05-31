//import 'dart:js_util';

import 'package:flutter/material.dart';
//import 'package:my_pfe/view/screen/auth/logoauth.dart';

class navBarVendeur extends StatelessWidget {
  const navBarVendeur({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const UserAccountsDrawerHeader(
          accountName: Text(''),
          accountEmail: Text('Bonjour'),
          decoration: BoxDecoration(color: Colors.green),
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today),
          title: const Text("consulter planing"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text("Enregistrer commande"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.add_box),
          title: const Text("Saisi commande"),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text("Log out"),
          onTap: () {},
        ),
      ]),
    );
  }
}
