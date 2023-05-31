import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin_controller/home_controller.dart';
import '../../widget/auth/nav_bar_vendeur.dart';

class HomeVendeur extends StatelessWidget {
  const HomeVendeur({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerA controller = Get.put(HomeControllerA());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Center(child: Text("Minoterie Othman ")),
      ),
      // backgroundColor: Colors.compexDrawerCanvasColor,
      drawerScrimColor: Colors.transparent,
      body: Container(
        child: Center(
          child: Text("${controller.id}"),
        ),
      ),
      drawer: const navBarVendeur(),
    );
  }
}
