class ConsulterCommandeModel {
  String? client;
  String? adressec;
  String? produits;
  int? prixCommande;
  String? secteur;
  String? vehiculeID;

  ConsulterCommandeModel(
      {this.client,
      this.adressec,
      this.produits,
      this.prixCommande,
      this.secteur,
      this.vehiculeID});

  ConsulterCommandeModel.fromJson(Map<String, dynamic> json) {
    client = json['client'];
    adressec = json['Adressec'];
    produits = json['produits'];
    prixCommande = json['prix_commande'];
    secteur = json['secteur'];
    vehiculeID = json['VehiculeID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client'] = this.client;
    data['Adressec'] = this.adressec;
    data['produits'] = this.produits;
    data['prix_commande'] = this.prixCommande;
    data['secteur'] = this.secteur;
    data['VehiculeID'] = this.vehiculeID;
    return data;
  }
}
