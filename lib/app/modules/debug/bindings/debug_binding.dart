import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/providers/user_provider.dart';
import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:delivery_app/app/modules/debug/controllers/debug_controller.dart';

class DebugBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DebugController>(
      DebugController(
        repository: UserRepository(
          provider: UserProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
