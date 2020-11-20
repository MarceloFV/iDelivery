import 'package:delivery_app/app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdressController extends GetxController {
  //TODO: Implement AdressController

  Adress oldAdress;
  Adress newAdress;
//   bairro
// numero
// cep
// rua

  TextEditingController bairroController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController ruaController = TextEditingController();

  @override
  void onInit() {
    oldAdress = mockedAdress;
    // adress = Get.arguments['adress']; //TODO: Implementar isso assim que tiver terminado a tela
    super.onInit();
  }

  loadCurrentAdress() {
    //TODO: Implement loadCurrentAdress in the fields;
  }

  onBackPressed() => Get.back();

  setAsDefault() {
    //TODO: Implement setAsDefault
  }

  onConfirmPressed() {
    Adress adress = Adress(
      bairro: bairroController.text,
      numero: numeroController.text,
      rua: ruaController.text,
      cep: cepController.text,
    );
    Get.back(result: adress);
  }
}

Adress mockedAdress =
    Adress(bairro: 'Centro', numero: '1', cep: '39890-000', rua: 'Praça paris');
