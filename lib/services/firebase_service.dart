import 'package:firebase_auth/firebase_auth.dart';
import 'package:localstorage/localstorage.dart';

class FirebaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      LocalStorage storage = new LocalStorage('hw');

      User user = userCredential.user;

      storage.setItem('access-token', user.uid);
      storage.setItem('refresh-token', user.refreshToken);

      return user;
    } catch (e) {
      throw e;
    }
  }
}
