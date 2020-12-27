import 'package:delivery_app/app/data/models/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {

  AddressModel currentAddress;
  AddressModel newAddress;

  TextEditingController bairroController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController ruaController = TextEditingController();

  String get currentRua => currentAddress?.rua;
  String get currentNumero => currentAddress?.numero;
  String get currentCep => currentAddress?.cep;
  String get currentBairro => currentAddress?.bairro;

  @override
  void onInit() {
    currentAddress = Get.arguments['address'];

    super.onInit();
  }

  onBackPressed() => Get.back();

  setAsDefault() {
    //TODO: Implement setAsDefault
  }

  onConfirmPressed() {
    AddressModel adress = AddressModel(
      bairro: bairroController.text,
      numero: numeroController.text,
      rua: ruaController.text,
      cep: cepController.text,
    );
    Get.back(result: adress);
  }
}

AddressModel mockedAdress = AddressModel(
    bairro: 'Centro', numero: '1', cep: '39890-000', rua: 'Praça paris');
