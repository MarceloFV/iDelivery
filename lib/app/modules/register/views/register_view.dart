import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(32),
        child: ListView(
          children: [
            Text(
              'Dados: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextFormField(
              controller: controller.nameController,
              decoration: InputDecoration(hintText: "Nome"),
            ),
            TextFormField(
              controller: controller.cpfController,
              decoration: InputDecoration(hintText: "CPF"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: controller.phoneController,
              decoration: InputDecoration(hintText: "Telefone"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: controller.emailController,
              decoration: InputDecoration(hintText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
            ),
            Divider(),
            Text(
              'Endereço: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextFormField(
              controller: controller.ruaController,
              decoration: InputDecoration(hintText: "Rua"),
            ),
            TextFormField(
              controller: controller.numeroController,
              decoration: InputDecoration(hintText: "Numero"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: controller.bairroController,
              decoration: InputDecoration(hintText: "Bairro"),
            ),
            TextFormField(
              controller: controller.cepController,
              decoration: InputDecoration(hintText: "CEP"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              onPressed: controller.register,
              child: Text("Confirmar"),
            ),
          ],
        ),
      ),
    );
  }
}
