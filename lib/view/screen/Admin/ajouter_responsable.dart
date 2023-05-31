import 'package:flutter/material.dart';

class AjouterRespo extends StatelessWidget {
  const AjouterRespo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter Vendeur'),
      ),
      body: Center(
        child: Container(
          child: const Text("Page Ajouter Vendeur "),
        ),
      ),
    );
  }
}
