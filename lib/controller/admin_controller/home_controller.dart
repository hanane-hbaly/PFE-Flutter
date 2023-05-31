import 'package:get/get.dart';
import 'package:my_pfe/core/serices.dart';

class HomeControllerA extends GetxController {
  MyServices myServices = Get.find();
  String? id;

  initialData() {
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
