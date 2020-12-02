import 'package:delivery_app/app/global_widgets/custom_app_bar.dart';
import 'package:delivery_app/app/global_widgets/custom_blue_button.dart';
import 'package:delivery_app/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends GetView<AddressController> {
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
            (controller.currentAddress != null) ?
            CurrentAdressSection(
              rua: controller.currentRua,
              bairro: controller.currentBairro,
              numero: controller.currentNumero,
              cep: controller.currentCep,
            ): Container(),
            Text(
              'Novo endereço:',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 6,
            ),
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
            SizedBox(
              height: 32,
            ),
            CustomBlueButton(
                function: controller.onConfirmPressed, text: 'Confirmar'),
          ],
        ),
      ),
    );
  }
}

class CurrentAdressSection extends StatelessWidget {
  final String rua;
  final String bairro;
  final String numero;
  final String cep;

  const CurrentAdressSection({Key key, this.rua, this.bairro, this.numero, this.cep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Endereço atual:',
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 6,
        ),
        Text('Rua: $rua'),
        SizedBox(
          height: 4,
        ),
        Text('Bairro: $bairro'),
        SizedBox(
          height: 4,
        ),
        Text('Numero: $numero'),
        SizedBox(
          height: 4,
        ),
        Text('CEP: $cep'),
        SizedBox(
          height: 4,
        ),
        Divider(),
      ],
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
