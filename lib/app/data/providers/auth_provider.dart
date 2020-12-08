import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class AuthProvider {
  FirebaseAuth auth;

  AuthProvider({@required this.auth});

  Future<String> login(email, password) async {
    var creds =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return creds.user.uid;
  }

  bool isUserConnected() => auth.currentUser != null;
  String getUID() => auth.currentUser.uid;

  Future<String> register(String email, String password) async {
    var creds = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return creds.user.uid;
  }

  Future<void> logout() => auth.signOut();
}
