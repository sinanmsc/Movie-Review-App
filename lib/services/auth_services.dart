import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> authStateChange() => auth.authStateChanges();

  Future<UserCredential> login(String email, String password) =>
      auth.signInWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> signup(String email, String password) =>
      auth.createUserWithEmailAndPassword(email: email, password: password);

  logout() => auth.signOut();
}
