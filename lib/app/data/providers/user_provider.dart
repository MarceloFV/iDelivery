import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/user.dart';

import 'package:meta/meta.dart';

const collectionPath = 'users';

class UserProvider {
  final FirebaseFirestore firestore;

  UserProvider({@required this.firestore});

  Future<UserModel> getCurrentUser(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await firestore.collection(collectionPath).doc(uid).get();
      UserModel user = UserModel.fromDocumentSnapshot(snapshot);
      return user;
    } catch (_) {
      return null;
    }
  }

  Future<UserModel> createUser(String uid, UserModel user) async {
    try {
      var reference = firestore.collection(collectionPath).doc(uid);
      reference.set(user.toMap());

      return user.copyWith(reference: reference);
    } catch (_) {
      rethrow;
    }
  }


  // Future<UserModel> editUser(UserModel user) async {
  //   try {
  //     user.reference.update(user.toMap());
  //     return user;
  //   } catch (_) {
  //     return null;
  //   }
  // }
}
