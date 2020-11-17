import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:delivery_app/app/data/models/product.dart';
// import 'package:delivery_app/app/data/providers/product_provider.dart';

class LayoutController extends GetxController {
  final UserRepository userRepository = UserRepository();
  // LayoutController({
  //   @required this.userRepository,
  // }) : assert(userRepository != null);

  final currentIndex = 0.obs;
  final pageController = PageController().obs;

  final _user = UserModel().obs;
  UserModel get user => _user.value;

  @override
  void onInit() {
    _user.value = Get.arguments['user'];
    super.onInit();
  }

  void onItemTapped(int index) {
    currentIndex.value = index;
    pageController.value.jumpToPage(index);
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void onLogoutPressed() async {
    await userRepository.logout();
    if (userRepository.isUserConnected()) {
      return;
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }

}
