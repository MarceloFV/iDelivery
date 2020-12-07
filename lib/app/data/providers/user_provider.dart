import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:meta/meta.dart';

const collectionPath = 'users';

class UserProvider {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  UserProvider({@required this.firestore, @required this.firebaseAuth});
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

//TODO: Mark to exclusion
  isUserConnected() => firebaseAuth.currentUser != null;
  //TODO: Mark to exclusion

  Future<UserModel> getUser(String id) async {
    try {
      DocumentSnapshot snapshot =
          await firestore.collection(collectionPath).doc(id).get();
      UserModel user = UserModel.fromDocumentSnapshot(snapshot);
      return user;
    } catch (_) {
      return null;
    }
  }

//TODO: Mark to exclusion
//Talvez nao seja necessario
  String getUserId() {
    try {
      return firebaseAuth.currentUser.uid;
    } catch (_) {
      return null;
    }
  }

  Future<UserModel> editUser(UserModel user) async {
    try {
      user.reference.update(user.toMap());
      //TODO: Testar
      return user;
    } catch (_) {
      return null;
    }
  }

//TODO: Mark to exclusion
  login(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      return null;
    }
  }

//TODO: Mark to exclusion
  logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {}
  }
}
