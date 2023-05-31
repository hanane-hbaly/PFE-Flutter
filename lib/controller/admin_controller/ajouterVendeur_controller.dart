import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_pfe/core/class/statusrequest.dart';
import 'package:my_pfe/core/function/handilingdata.dart';
import 'package:my_pfe/data/datasource/remote/adminData/ajouterVendeurdata.dart';

class AjouterVendeurController extends GetxController {
  late TextEditingController cin;
  late TextEditingController nomv;
  late TextEditingController prenomv;
  late TextEditingController telev;
  late TextEditingController id;

  late StatusRequest statusRequest;
  AjouterVendeurData ajouterVendeurData = AjouterVendeurData(Get.find());

  enregister() async {
    statusRequest = StatusRequest.loading;
    var response = await ajouterVendeurData.postdata(
        id.text, cin.text, nomv.text, prenomv.text, telev.text);
    print("============================== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("============================== $response");
        Get.defaultDialog(
            title: "Success",
            middleText: "Le vendeur a été enregistré avec succès");
        // Get.back();
      } else {
        Get.defaultDialog(
            title: "Waring", middleText: "id or cin already Exists");
        statusRequest = StatusRequest.failure;
      }
    }
  }

  annuler() {
    id.clear();
    cin.clear();
    prenomv.clear();
    nomv.clear();
    telev.clear();
  }

  @override
  void onInit() {
    cin = TextEditingController();
    nomv = TextEditingController();
    prenomv = TextEditingController();
    telev = TextEditingController();
    id = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    cin.dispose();
    nomv.dispose();
    prenomv.dispose();
    telev.dispose();
    id.dispose();
    super.dispose();
  }
}
