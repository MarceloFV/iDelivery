import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/repository/auth_repository.dart';
import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class RegisterController extends GetxController {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  RegisterController({
    @required this.userRepository,
    @required this.authRepository,
  }) : assert(userRepository != null);

  TextEditingController nameController = TextEditingController();
  var cpfController = new MaskedTextController(mask: '000.000.000-00');
  var phoneController = new MaskedTextController(mask: '(00) 00000-0000');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  var cepController = new MaskedTextController(mask: '00000-000');


  register() async {
    Address address = Address(
      bairro: bairroController.text,
      cep: cepController.text,
      numero: numeroController.text,
      rua: ruaController.text,
    );
    UserModel user = UserModel(
      name: nameController.text,
      email: emailController.text,
      cpf: cpfController.text,
      phoneNumber: phoneController.text,
      address: address,
    );

    String email = emailController.text;
    String password = passwordController.text;

    try {
      var uid = await authRepository.register(email, password);
      user = await userRepository.createUser(uid, user);
      if (user != null) Get.offAllNamed(Routes.HOME, arguments: {'user': user});
    } catch (e) {
      if (Get.isSnackbarOpen) Get.back();
      Get.snackbar("Falha ao cadastrar usuário", "Tente novamente...");
    }
  }
}
