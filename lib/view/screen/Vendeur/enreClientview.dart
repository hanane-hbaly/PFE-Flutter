import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_pfe/core/constant/linkapi.dart';

class ClientRegistrationPage extends StatefulWidget {
  const ClientRegistrationPage({super.key});

  @override
  _ClientRegistrationPageState createState() => _ClientRegistrationPageState();
}

class _ClientRegistrationPageState extends State<ClientRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _secteurOptions = [];
  String? _selectedSector;
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchSecteurOptions();
  }

  Future<void> _fetchSecteurOptions() async {
    final response = await http.get(Uri.parse(AppLink.enregistrerClient));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      setState(() {
        _secteurOptions = List<String>.from(responseData['secteurOptions']);
      });
    } else {
      // Gérer les erreurs de requête HTTP
    }
  }

  Future<void> _saveClient() async {
    if (_formKey.currentState!.validate()) {
      // Vérifier si l'adresse est null
      if (_adresseController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: const Text('Veuillez récupérer l\'adresse'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        return;
      }

      // Enregistrer le client dans la base de données
      final response = await http.post(
        Uri.parse(AppLink.enregistrerClient),
        body: {
          'secteur': _selectedSector!,
          'nom': _nomController.text,
          'prenom': _prenomController.text,
          'telephone': _telephoneController.text,
          'adresse': _adresseController.text,
        },
      );

      if (response.statusCode == 200) {
        // Afficher une boîte de dialogue ou une notification pour indiquer que l'enregistrement est réussi

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Enregistrement réussi'),
              content: const Text('Le client a été enregistré avec succès.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Gérer les erreurs de requête HTTP
      }
    }
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _telephoneController.dispose();
    _adresseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 72, 149, 75),
        title: const Text('Enregistrer un client'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedSector,
                      items: _secteurOptions.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSector = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Sélectionner un secteur',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: const Icon(Icons.public,
                            color: Color.fromARGB(255, 7, 136, 11)),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Veuillez sélectionner un secteur';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _nomController,
                      decoration: InputDecoration(
                        labelText: 'Nom',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: const Icon(Icons.person_2_outlined,
                            color: Color.fromARGB(255, 7, 136, 11)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez saisir un nom';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _prenomController,
                      decoration: InputDecoration(
                        labelText: 'Prénom',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: const Icon(Icons.person_2,
                            color: Color.fromARGB(255, 7, 136, 11)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez saisir un prénom';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _telephoneController,
                      decoration: InputDecoration(
                        labelText: 'Téléphone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: const Icon(Icons.phone,
                            color: Color.fromARGB(255, 7, 136, 11)),
                      ),
                      keyboardType:
                          TextInputType.phone, // Afficher le clavier numérique
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez saisir un numéro de téléphone';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.location_on, color: Colors.white),
                      label: const Text('Obtenir l\'adresse'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 215, 136, 57),
                        elevation: 2.0,
                      ),
                      onPressed: () async {
                        try {
                          Position position =
                              await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.high,
                          );

                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                            position.latitude,
                            position.longitude,
                          );

                          Placemark placemark = placemarks.first;
                          String address =
                              '${placemark.street}, ${placemark.locality}, ${placemark.postalCode}';

                          _adresseController.text = address;
                        } catch (e) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Erreur'),
                                content: const Text(
                                    'Veuillez activer le GPS pour obtenir l\'adresse.'),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _adresseController,
                      decoration: InputDecoration(
                        labelText: 'Adresse',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: const Icon(Icons.location_on,
                            color: Color.fromARGB(255, 198, 58, 12)),
                      ),
                      maxLines: null,
                      enabled: false,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 2.0,
                      ),
                      onPressed: _saveClient,
                      child: const Text('Enregistrer'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
