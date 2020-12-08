import 'package:delivery_app/app/data/models/store.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  StoreModel store;
  @override
  void onInit() {
    store = Get.arguments['store'];
    super.onInit();
  }
}
