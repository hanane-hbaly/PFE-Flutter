import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pfe/controller/admin_controller/produits/produitA_controller.dart';
import 'package:my_pfe/core/class/handlingdataview.dart';
import 'package:my_pfe/core/shared/customtextformglobal.dart';

import '../../../widget/auth/custombuttomauth.dart';

class ProduitAdd extends StatelessWidget {
  const ProduitAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProduitAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Produit add'),
        ),
        body: GetBuilder<ProduitAddController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(children: <Widget>[
                      CustomTextFormGlobal(
                          hinttext: 'entrer le nom',
                          labeltext: 'produit name',
                          mycontroller: controller.nomp,
                          iconData: Icons.category),
                      CustomTextFormGlobal(
                          hinttext: 'entrer le prix',
                          labeltext: 'produit prix',
                          mycontroller: controller.prixp,
                          iconData: Icons.category),
                      CustomTextFormGlobal(
                          hinttext: 'entrer le type',
                          labeltext: 'produit type',
                          mycontroller: controller.typep,
                          iconData: Icons.category),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: MaterialButton(
                            color: Colors.green[100],
                            textColor: Colors.green[800],
                            onPressed: () {
                              controller.chooseImage();
                            },
                            child: const Text("chose category image"),
                          )),
                      // if (controller.file != null)
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtomAuth(
                        text: 'Ajouter',
                        onPressed: () {
                          controller.addData();
                        },
                      )
                    ]),
                  ),
                )));
  }
}
