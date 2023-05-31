import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pfe/controller/admin_controller/ajouterVendeur_controller.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextfromauth.dart';

class AjouterVendeur extends StatelessWidget {
  const AjouterVendeur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AjouterVendeurController controller = Get.put(AjouterVendeurController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Center(child: Text("Minoterie Othman ")),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                "Ajouter Vendeur ",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    decorationThickness: 60,
                    overflow: TextOverflow.clip),
              ),
            ),
          ),
          const SizedBox(height: 40),
          CustonTextFormAuth(
            mycontroller: controller.nomv,
            hinttext: "  Nom ",
            iconData: Icons.person_outline,
            labeltext: "Username",
          ),
          CustonTextFormAuth(
            mycontroller: controller.prenomv,
            hinttext: " Prenom ",
            iconData: Icons.person_outline,
            labeltext: "Prenom",
          ),
          CustonTextFormAuth(
            mycontroller: controller.telev,
            hinttext: "Numero de Telephone",
            iconData: Icons.phone_android_outlined,
            labeltext: "Phone",
          ),
          CustonTextFormAuth(
            mycontroller: controller.id,

            hinttext: " Id",
            iconData: Icons.open_in_full_outlined,
            labeltext: "Id",
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            mycontroller: controller.cin,
            hinttext: " Password",
            iconData: Icons.lock_outline,
            labeltext: "Password",
          ),
          Center(
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: CustomButtomAuth(
                      text: "Enregister",
                      onPressed: () {
                        controller.enregister();
                      },
                      width: 150,
                    ),
                  ),
                  CustomButtomAuth(
                    text: "Annuler",
                    onPressed: () {
                      controller.annuler();
                    },
                    width: 150,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
