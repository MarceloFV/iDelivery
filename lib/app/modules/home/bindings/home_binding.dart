import 'package:delivery_app/app/global_controllers/app_controller.dart';
import 'package:get/get.dart';

import 'package:delivery_app/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(
      AppController(),
      permanent: true,
    ); // TODO: Remover isso e passar pra pagina inicial do app
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
