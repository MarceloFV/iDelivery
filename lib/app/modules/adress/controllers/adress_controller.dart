import 'package:delivery_app/app/data/models/user.dart';
import 'package:get/get.dart';

class AdressController extends GetxController {
  //TODO: Implement AdressController

  Adress oldAdress;
  Adress newAdress;

  @override
  void onInit() {
    oldAdress = mockedAdress;
    // adress = Get.arguments['adress']; //TODO: Implementar isso assim que tiver terminado a tela
    super.onInit();
  }

  onBackPressed() {
    // if (newAdress != null) // TODO: Talvez nao seja necessario
    Get.back();
  }
}

Adress mockedAdress =
    Adress(bairro: 'Centro', numero: '1', cep: '39890-000', rua: 'Praça paris');
