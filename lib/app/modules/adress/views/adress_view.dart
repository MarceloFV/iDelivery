import 'package:delivery_app/app/global_widgets/custom_app_bar.dart';
import 'package:delivery_app/app/global_widgets/custom_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/app/modules/adress/controllers/adress_controller.dart';

class AdressView extends GetView<AdressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Adicionar endereço',
        onBackPressed: controller.onBackPressed,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(32),
        child: ListView(
          children: [
            CustomTextField(
              controller: controller.ruaController,
              hintText: 'Rua',
            ),
            CustomTextField(
              controller: controller.numeroController,
              hintText: 'Numero',
            ),
            CustomTextField(
              controller: controller.bairroController,
              hintText: 'Bairro',
            ),
            CustomTextField(
              controller: controller.cepController,
              hintText: 'CEP', 
            ),
            // SizedBox(height: 16,), // TODO: Implementar definir como endereço principal
            // CheckboxListTile(contentPadding: EdgeInsets.all(0), value: false, onChanged: null, title: Text('Desejo definir esse endereço como principal'), controlAffinity: ListTileControlAffinity.leading,),
            SizedBox(height: 32,),
            CustomBlueButton(function: controller.onConfirmPressed, text: 'Confirmar'),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({Key key, this.controller, this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText, 
      ),
    );
  }
}
