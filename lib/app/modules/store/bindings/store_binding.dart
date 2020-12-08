import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:delivery_app/app/data/repository/product_repository.dart';
import 'package:get/get.dart';
import 'package:delivery_app/app/modules/store/controllers/store_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(
        productRepository: ProductRepository(
          provider: ProductProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
