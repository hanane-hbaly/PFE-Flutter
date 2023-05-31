import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pfe/controller/admin_controller/bloquer_vendeur_controller.dart';

class BloquerVendeur extends StatelessWidget {
  const BloquerVendeur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BlocageController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: const Center(child: Text("Minoterie Othman")),
        ),
        body: GetBuilder<BlocageController>(builder: (controller) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Gestion de blocage des vendeurs",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.vendeur.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // print(
                        //     'Index: $index, Action: ${controller.vendeur[index]["service"]}');
                        controller.showDialogBox(context, index);
                      },
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                              '${controller.vendeur[index]["Nomv"]}  ${controller.vendeur[index]["Prenomv"]}'),
                          subtitle: Text(controller.vendeur[index]["idV"]),
                          trailing: Icon(
                            controller.vendeur[index]["service"] == 1
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: controller.vendeur[index]["service"] == 1
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }));
  }
}
