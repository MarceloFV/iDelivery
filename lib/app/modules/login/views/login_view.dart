import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(32),
        child: Column(children: [
          Obx(() => TextFormField(
                decoration: InputDecoration(
                    hintText: "Email", errorText: controller.emailError.value),
                onChanged: controller.onEmailChanged,
              )),
          Obx(() => TextFormField(
                decoration: InputDecoration(
                    hintText: "Password",
                    errorText: controller.passwordError.value),
                obscureText: true,
                onChanged: controller.onPasswordChanged,
              )),
          RaisedButton(
            onPressed: controller.login,
            child: Text("Confirm"),
          ),
          FlatButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: Text("Cadastrar"))
        ]),
      ),
    );
  }
}
