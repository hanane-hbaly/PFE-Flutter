import 'package:my_pfe/core/class/crud.dart';
import 'package:my_pfe/core/constant/linkapi.dart';

class AjouterVendeurData {
  Crud crud;
  AjouterVendeurData(this.crud);
  postdata(
      String id, String cin, String nomv, String prenomv, String telev) async {
    var response = await crud.postData(AppLink.ajouterV, {
      "id": id,
      "cin": cin,
      "nomv": nomv,
      "prenomv": prenomv,
      "telev": telev
    });
    return response.fold((l) => l, (r) => r);
  }
}
