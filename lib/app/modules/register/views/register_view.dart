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
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(hintText: "Name"),
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: controller.register,
                child: Text("Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
