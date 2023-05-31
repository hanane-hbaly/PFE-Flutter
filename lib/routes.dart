import 'package:get/get.dart';
import 'package:my_pfe/core/constant/routes.dart';
import 'package:my_pfe/core/middlware/mymiddlware.dart';
import 'package:my_pfe/view/screen/Admin/Produit/produit_add.dart';
import 'package:my_pfe/view/screen/Admin/Produit/produit_edit.dart';
import 'package:my_pfe/view/screen/Admin/ajouterVendeur.dart';
import 'package:my_pfe/view/screen/Admin/ajouter_responsable.dart';
import 'package:my_pfe/view/screen/Admin/bloquer_vendeur.dart';
import 'package:my_pfe/view/screen/Admin/commandeAView.dart';
import 'package:my_pfe/view/screen/Admin/consulter_planningA_view.dart';
import 'package:my_pfe/view/screen/Admin/homerespo.dart';
import 'package:my_pfe/view/screen/auth/login.dart';
import 'package:my_pfe/view/screen/Vendeur/homeVendeur.dart';

import 'view/screen/Admin/Produit/produit_view.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Login(), middlewares: [MyMiddlWare()]),
  GetPage(name: AppRoute.homaVendeur, page: () => const HomeVendeur()),
  GetPage(name: AppRoute.homaAdmin, page: () => const HomeAdmin()),
  GetPage(name: AppRoute.ajoutervendeur, page: () => const AjouterVendeur()),
  GetPage(name: AppRoute.bloquervendeur, page: () => const BloquerVendeur()),
  GetPage(name: AppRoute.ajouterrespo, page: () => const AjouterRespo()),
  GetPage(name: AppRoute.planningView, page: () => const PlanningView()),
  GetPage(name: AppRoute.commandeAView, page: () => CommandeAView()),
  GetPage(name: AppRoute.produitAView, page: () => const ProduitAView()),
  GetPage(name: AppRoute.produitAAdd, page: () => const ProduitAdd()),
  GetPage(name: AppRoute.produitAEdit, page: () => const ProduitEdit()),
];
