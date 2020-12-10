import 'package:delivery_app/app/data/repository/auth_repository.dart';
import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  LoginController({
    @required this.userRepository,
    @required this.authRepository,
  }) : assert(userRepository != null);

  final email = "".obs;
  final password = "".obs;
  final emailError = RxString();
  final passwordError = RxString();

  onEmailChanged(String changedEmail) {
    if (!GetUtils.isEmail(changedEmail)) {
      emailError.value = "Email inválido";
      return;
    }
    emailError.value = null;
    email.value = changedEmail;
  }

  onPasswordChanged(String changedPassword) {
    if (changedPassword.length < 6) {
      passwordError.value = "Senha inválida";
      return;
    }
    passwordError.value = null;
    password.value = changedPassword;
  }

  login() async {
    try {
      var uid = await authRepository.login(email.value, password.value);
      var user = await userRepository.getCurrentUser(uid);

      if (user == null && uid == null)
        //TODO: Implement invalid credentials
        print('tudo errado, preencha dnv os campos');
        //Esse ja esta pegando no catch
      if (user == null && uid != null)
        //TODO: Implement store app email
        return print('Mano para de tentar usar email de loja');
      if (user != null && uid != null)
        Get.offAndToNamed(Routes.HOME, arguments: {'user': user});
    } catch (e) {
      if (Get.isSnackbarOpen) Get.back();
      Get.snackbar("Usuário inválido", "Email ou senha incorretos",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          dismissDirection: SnackDismissDirection.HORIZONTAL);
    }
  }
}
