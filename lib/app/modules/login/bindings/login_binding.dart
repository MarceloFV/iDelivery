import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/providers/auth_provider.dart';
import 'package:delivery_app/app/data/providers/user_provider.dart';
import 'package:delivery_app/app/data/repository/auth_repository.dart';
import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:delivery_app/app/modules/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
          userRepository: UserRepository(
            provider: UserProvider(
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
