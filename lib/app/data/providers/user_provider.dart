import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:meta/meta.dart';

const collectionPath = 'users';

class UserProvider {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  UserProvider({@required this.firestore, @required this.firebaseAuth});

  isUserConnected() => firebaseAuth.currentUser != null;

  createUser(UserModel user, String password) async {
    try {
      UserCredential userCredential =
          await _createUserWithEmailAndPassword(user.email, password);
      DocumentReference reference;
      if (userCredential != null) {
        reference =
            firestore.collection(collectionPath).doc(userCredential.user.uid);
        reference.set(user.toDocument());

        return user.copyWith(reference: reference);
      }
    } catch (_) {
      rethrow;
    }
  }

  // TODO: Deletar esse metodo
  getUserMocked() {
    return UserModel(
      name: 'Marcelo',
      // 'Praça Paris, 1, 39890-000'
      adress: Address(bairro: 'Centro', numero: '1', cep: '39890-000', rua: 'Praça paris'),
    );
  }

  Future<UserCredential> _createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

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
      user.reference.update(user.toDocument());
      return user;
    } catch (_) {
      return null;
    }
  }

  login(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      return null;
    }
  }

  logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {}
  }
}
