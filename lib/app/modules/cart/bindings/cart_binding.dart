import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/providers/request_provider.dart';
import 'package:delivery_app/app/data/repository/request_repository.dart';
import 'package:get/get.dart';

import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    if (Get.isRegistered<CartController>())
      Get.find<CartController>();
    else
      Get.put(CartController(repository: RequestRepository(provider: RequestProvider(firestore: FirebaseFirestore.instance))), permanent: true);
  }
}
