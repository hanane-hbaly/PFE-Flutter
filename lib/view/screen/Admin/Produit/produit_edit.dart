import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pfe/core/class/handlingdataview.dart';
import 'package:my_pfe/core/shared/customtextformglobal.dart';

import '../../../../controller/admin_controller/produits/produitE_controller.dart';
import '../../../widget/auth/custombuttomauth.dart';

class ProduitEdit extends StatelessWidget {
  const ProduitEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProduitEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Produit edit'),
        ),
        body: GetBuilder<ProduitEditController>(
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
                        text: 'Enregistrer',
                        onPressed: () {
                          controller.editData();
                        },
                      )
                    ]),
                  ),
                )));
  }
}
