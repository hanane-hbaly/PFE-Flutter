// import 'package:get/get.dart';
// import 'package:my_pfe/core/serices.dart';
// import 'package:my_pfe/data/datasource/remote/vendeurData/enregistrerCommandeData.dart';
// import '../../core/class/statusrequest.dart';
// import '../../core/function/handilingdata.dart';
// //import 'package:http/http.dart' as http;

// class EnregistrerCommandeController extends GetxController {
//   EnregistrerCommandeData enregistrerCommandeData =
//       EnregistrerCommandeData(Get.find());
//   MyServices myServices = Get.find();
//   String? idv;
//   late StatusRequest statusRequest;
//   List<dynamic> client = [];
//   //Map<String, dynamic> client = {};
//   //List client = [];
//   String? selectedValue;

//   initialData() {
//     idv = myServices.sharedPreferences.getString("id");
//   }

//   getClients() async {
//     statusRequest = StatusRequest.loading;
//     var response = await enregistrerCommandeData.getClient(idv!);
//     print("***************Clients**** $response");
//     statusRequest = handlingData(response);

//     if (StatusRequest.success == statusRequest) {
//       if (response['data'] != null) {
//         client = response;
//         update();
//       }
//       // client = response;
//       // print(client);
//       //update();
//       //client = List<Map<dynamic, dynamic>>.from(response);
//     }
//     update();
//   }

//   setSelectedvalue(value) {
//     selectedValue = value.toString();
//     update();
//   }

//   @override
//   void onInit() async {
//     initialData();
//     await getClients();
//     super.onInit();
//   }
// }
