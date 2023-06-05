import 'package:get/get.dart';
import 'package:my_pfe/core/serices.dart';
import '../../core/class/statusrequest.dart';
import '../../data/datasource/remote/adminData/get_vendeurs_data.dart';

class HomeControllerA extends GetxController {
  GetVendeursData getVendeursData = GetVendeursData(Get.find());
  MyServices myServices = Get.find();
  String? id;
  late StatusRequest statusRequest;
  List vendeur = [];

  initialData() {
    id = myServices.sharedPreferences.getString("id");
  }

  // getVendeur(String i) async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await getVendeursData.getvedeurbyid(i);
  //   statusRequest = handlingData(response);
  //   //print("********************** $response");

  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       vendeur.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
