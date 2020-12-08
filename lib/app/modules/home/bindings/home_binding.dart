import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/providers/auth_provider.dart';
import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:delivery_app/app/data/repository/auth_repository.dart';
import 'package:delivery_app/app/data/repository/product_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:delivery_app/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        productRepository: ProductRepository(
          provider: ProductProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
        authRepository: AuthRepository(
          provider: AuthProvider(
            auth: FirebaseAuth.instance,
          ),
        ),
      ),
    );
  }
}
