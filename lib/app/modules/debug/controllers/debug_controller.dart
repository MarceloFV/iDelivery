import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DebugController extends GetxController {
  final UserRepository repository;

  DebugController({@required this.repository});
  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    var user = await repository.getCurrentUser('saudhsuduaudsahuah');
    Get.offAllNamed(Routes.HOME, arguments: {'user': user});
  }
}
