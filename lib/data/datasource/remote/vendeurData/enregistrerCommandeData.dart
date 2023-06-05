import 'package:my_pfe/core/constant/linkapi.dart';

import '../../../../core/class/crud.dart';

class EnregistrerCommandeData {
  Crud crud;
  EnregistrerCommandeData(this.crud);

  getClient(String idv) async {
    var data = {"idv": idv};
    var response = await crud.postData(AppLink.getAllC, data);
    return response.fold((l) => l, (r) => r);
  }
}
