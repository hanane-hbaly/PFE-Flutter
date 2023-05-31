// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_pfe/controller/admin_controller/produits/produitV_controller.dart';
import 'package:my_pfe/core/class/handlingdataview.dart';
import 'package:my_pfe/core/constant/linkapi.dart';
import 'package:my_pfe/core/constant/routes.dart';
// import 'dart:io';

class ProduitAView extends StatelessWidget {
  const ProduitAView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProduitController());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Produits'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.produitAAdd);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<ProduitController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child:
                                    //  SvgPicture.network(
                                    //   "${AppLink.imagep}/${controller.data[index].Imagep}",
                                    //   height: 150,
                                    // ),

                                    Container(
                                  padding: const EdgeInsets.all(4),
                                  child: CachedNetworkImage(
                                      height: 110,
                                      // width: 60,
                                      imageUrl:
                                          "${AppLink.imagep}/${controller.data[index].Imagep}"),
                                )),
                            Expanded(
                                flex: 3,
                                child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          controller.goToPageEdit(
                                              controller.data[index]);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          Get.defaultDialog(
                                              title: "Attention",
                                              middleText: "are you sure",
                                              onCancel: () {},
                                              onConfirm: () {
                                                controller.deleteProduit(
                                                    controller
                                                        .data[index].ProduitID!,
                                                    controller
                                                        .data[index].Imagep!);
                                                Get.back();
                                              });
                                        },
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                      " Prix: ${controller.data[index].Prixp}"),

                                  title: Text(
                                      '${controller.data[index].Nomp!} ${controller.data[index].Typep}'),
                                  // controller.data[index].Nomp
                                ))
                          ],
                        ),
                      );
                    },
                  ))),
        ));
  }
}
