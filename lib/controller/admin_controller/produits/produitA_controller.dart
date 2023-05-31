import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pfe/controller/admin_controller/produits/produitV_controller.dart';
import 'package:my_pfe/core/class/statusrequest.dart';
import 'package:my_pfe/core/constant/routes.dart';
//import 'package:my_pfe/core/constant/routes.dart';
import 'package:my_pfe/core/function/uploadfile.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/datasource/remote/adminData/produitData.dart';

class ProduitAddController extends GetxController {
  ProduitData produitData = ProduitData(Get.find());
  late TextEditingController nomp;
  late TextEditingController prixp;
  late TextEditingController typep;
  File? file;
  StatusRequest? statusRequest = StatusRequest.none;
  chooseImage() async {
    file = await fileUploadGallery();
    update();
  }

  addData() async {
    if (file == null) Get.defaultDialog(title: "warnnig");
    statusRequest = StatusRequest.loading;
    update();
    // if (file == null) Get.snackbar("Warning", "please Choose Image");

    Map data = {
      "Nomp": nomp.text,
      "Prixp": prixp.text,
      "Typep": typep.text,
    };
    var response = await produitData.add(data, file!);
    statusRequest = handlingData(response);
    print("********************** $response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        nomp.clear();
        prixp.clear();
        typep.clear();
        file!.delete();
        //Get.offNamed(AppRoute.produitAView);
        ProduitController pc = Get.find();
        pc.getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    nomp = TextEditingController();
    prixp = TextEditingController();
    typep = TextEditingController();
    //addData();
    //chooseImage();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.homaAdmin);
    return Future.value(false);
  }
}
