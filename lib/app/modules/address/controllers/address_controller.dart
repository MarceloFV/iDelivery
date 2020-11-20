import 'package:delivery_app/app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  //TODO: Implement AdressController

  Address currentAddress;
  Address newAdress;
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
    currentAddress = mockedAdress;
    // adress = Get.arguments['adress']; //TODO: Implementar isso assim que tiver terminado a tela
    super.onInit();
  }

  loadCurrentAddress() {
    //TODO: Implement loadCurrentAdress in the fields;
    currentAddress = Get.arguments['adress'];
  }

  onBackPressed() => Get.back();

  setAsDefault() {
    //TODO: Implement setAsDefault
  }

  onConfirmPressed() {
    Address adress = Address(
      bairro: bairroController.text,
      numero: numeroController.text,
      rua: ruaController.text,
      cep: cepController.text,
    );
    Get.back(result: adress);
  }
}

Address mockedAdress =
    Address(bairro: 'Centro', numero: '1', cep: '39890-000', rua: 'Praça paris');
