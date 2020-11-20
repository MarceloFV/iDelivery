import 'package:get/get.dart';

import 'package:delivery_app/app/modules/adress/controllers/adress_controller.dart';

class AdressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdressController>(
      () => AdressController(),
    );
  }
}
