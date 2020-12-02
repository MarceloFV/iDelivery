import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';

class UserRepository {
  final UserProvider provider = UserProvider(
    firestore: FirebaseFirestore.instance,
    firebaseAuth: FirebaseAuth.instance,
  );

  // UserRepository({@required this.provider}) : assert(provider != null);

  createUser(UserModel user, String password) =>
      provider.createUser(user, password);

  Future<UserModel> getUser(String id) => provider.getUser(id);

  String getUserId() => provider.getUserId();

  editUser(UserModel user) => provider.editUser(user);

  login(String email, String password) => provider.login(email, password);

  logout() => provider.logout();

  bool isUserConnected() => provider.isUserConnected();
}
