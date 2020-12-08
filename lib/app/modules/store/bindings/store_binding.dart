import 'package:get/get.dart';
import 'package:delivery_app/app/modules/store/controllers/store_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(),
    );
  }
}
