import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:healthwellness/services/base_service.dart';
import 'package:localstorage/localstorage.dart';
import 'package:healthwellness/utils/urls.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class FirebaseService extends BaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  LocalStorage storage = GetIt.I.get<LocalStorage>(instanceName: 'storage');

  FirebaseStorage fireStorage = FirebaseStorage.instance;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Map<String, String> body = {"email": email, "senha": password};
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await this.client.post(API_AUTH + API_AUTHENTICATE,
          headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        storage.setItem('access-token', responseData['data']['accessToken']);
        storage.setItem('refresh-token', responseData['data']['refreshToken']);
      } else {
        throw Exception();
      }
    } catch (e) {
      print('erro ${e}');
      throw e;
    }
  }

  Future<void> logout() async {
    try {
      await storage.deleteItem('access-token');
      await storage.deleteItem('refresh-token');
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<User> checkCurrentUser() async {
    return _auth.currentUser;
  }

  Future<String> uploadFile(String filePath, String fileName) async {
    String uid = _auth.currentUser.uid;
    File file = File(filePath);

    try {
      String firebaseFilePath = "exames/${uid}/${fileName}";
      await fireStorage.ref(firebaseFilePath).putFile(file);
      return firebaseFilePath;
    } catch (e) {
      print("UPLOAD ERROR");
      throw e;
    }
  }
}
