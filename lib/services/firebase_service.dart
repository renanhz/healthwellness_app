import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      print(userCredential);
    } on FirebaseAuthException catch (e) {}
  }
}
