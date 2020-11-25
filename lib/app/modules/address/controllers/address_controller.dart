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

  String get currentRua => currentAddress.rua;
  String get currentNumero => currentAddress.numero;
  String get currentCep => currentAddress.cep;
  String get currentBairro => currentAddress.bairro;

  @override
  void onInit() {
    currentAddress = Get.arguments['adress'];
    super.onInit();
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

Address mockedAdress = Address(
    bairro: 'Centro', numero: '1', cep: '39890-000', rua: 'Praça paris');
