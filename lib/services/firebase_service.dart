import 'package:firebase_auth/firebase_auth.dart';
import 'package:localstorage/localstorage.dart';

class FirebaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  LocalStorage storage = new LocalStorage('hw');

  Future<User> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = userCredential.user;

      storage.setItem('access-token', user.uid);
      storage.setItem('refresh-token', user.refreshToken);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> logout() async {
    try {
      await storage.clear();
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
