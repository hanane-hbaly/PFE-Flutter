import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/admin_controller/consulterCommandeController.dart';
import '../../../core/class/handlingdataview.dart';

class ConsulterCommandeView extends StatefulWidget {
  const ConsulterCommandeView({super.key});
  @override
  _ConsulterCommandeViewState createState() => _ConsulterCommandeViewState();
}

class _ConsulterCommandeViewState extends State<ConsulterCommandeView> {
  @override
  Widget build(BuildContext context) {
    Get.put(ConsulterCommandeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Center(child: Text("Consulter Commande   ")),
      ),
      drawerScrimColor: Colors.transparent,
      body: GetBuilder<ConsulterCommandeController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child: DropdownButtonFormField(
                        hint: const Text("Sélectionner un vendeur "),
                        value: controller.selectedValue,
                        items: controller.vendeur.map((vendeur) {
                          return DropdownMenuItem(
                            value: vendeur.nom_complet,
                            child: Text(vendeur.nom_complet!),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.setSelectedvalue(value);
                        },
                        decoration: InputDecoration(
                          //labelText: 'Sélectionner un client ',
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(185, 1, 103, 48)),
                          ),
                          filled: true,
                          fillColor: Colors.green[60],
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Veuillez sélectionner le client';
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: controller.datee,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2054),
                        ).then((date) {
                          if (date != null) {
                            setState(() {
                              controller.datee = date;
                            });
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                              'Début : ${DateFormat('yyyy/MM/dd').format(controller.datee)}'),
                          const Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {
                        controller.getCommandes();
                      },
                      child: const Text('Charger les affectations'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
