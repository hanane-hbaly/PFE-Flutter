//const String linkServerName = "http://10.0.2.2/ProjetPfe";
import 'dart:io';

class AppLink {
  static String get linkServerName {
    if (Platform.isAndroid || Platform.isIOS) {
      return 'http://10.0.2.2/ProjetPfe'; // Lien pour l'émulateur Android
    } else {
      return 'http://localhost/ProjetPfe'; // Lien générique pour les autres plates-formes
    }
  }

  // static const String linkServerName = "http://localhost/ProjetPfe";

  static String linkLogin = "$linkServerName/auth/sighnup.php";
  static String ajouterV = "$linkServerName/admin/ajouterVendeur.php";
  static String getAllV = "$linkServerName/admin/getAllVendeur.php";
  static String getAllVS = "$linkServerName/admin/getVendeurOnService.php";
  static String getAllcommandA = "$linkServerName/admin/consultercommande.php";
  static String bloquerV = "$linkServerName/admin/bloquerVendeur.php";
  static String getvendeurById = "$linkServerName/admin/getVendeurById.php";
  static String consulterPlaningA =
      "$linkServerName/admin/consulterPlaning.php";
  static String prodduitV = "$linkServerName/admin/gereProduit/view.php";
  static String prodduitA = "$linkServerName/admin/gereProduit/add.php";
  static String prodduitE = "$linkServerName/admin/gereProduit/edit.php";
  static String prodduitD = "$linkServerName/admin/gereProduit/delete.php";
  static String testphp = "$linkServerName/test.php";
  static String imagep = "$linkServerName/upload/produits";
}
