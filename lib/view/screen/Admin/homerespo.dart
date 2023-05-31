import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pfe/view/widget/nav_bar.dart';

import '../../../controller/admin_controller/home_controller.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

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
      drawer: const NavBar(),
    );
  }
}
