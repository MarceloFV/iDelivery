// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:delivery_app/app/data/providers/user_provider.dart';
// import 'package:delivery_app/app/data/repository/user_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:delivery_app/app/modules/layout/controllers/layout_cart_controller.dart';
import 'package:get/get.dart';

import 'package:delivery_app/app/modules/layout/controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LayoutController>(
      LayoutController(
          // userRepository: UserRepository(
          //   provider: UserProvider(
          //     firestore: FirebaseFirestore.instance,
          //     firebaseAuth: FirebaseAuth.instance,
          //   ),
          // ),
          ),
    );

    Get.put<LCartController>(LCartController());
  }
}
