//import 'dart:ffi';

class CategoriesModel {
  int? ProduitID;
  String? Nomp;
  int? Prixp;
  int? Typep;
  String? Imagep;
  String? categoriesDatetime;

  CategoriesModel(
      {this.ProduitID,
      this.Nomp,
      this.Prixp,
      this.Typep,
      this.Imagep,
      this.categoriesDatetime});

  //this.categoriesDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    ProduitID = json['ProduitID'];
    Nomp = json['Nomp'];
    Prixp = json['Prixp'];
    Typep = json['Typep'];
    Imagep = json['Imagep'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProduitID'] = ProduitID;
    data['Nomp'] = Nomp;
    data['Prixp'] = Prixp;
    data['Typep'] = Typep;
    data['Imagep'] = Imagep;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
