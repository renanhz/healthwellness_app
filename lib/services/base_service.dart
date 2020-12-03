import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' show Client;

class BaseService {
  Client client = Client();
  LocalStorage storage = GetIt.I.get<LocalStorage>(instanceName: 'storage');

  Future<Map<String, String>> buildHeaders() async {
    String accessToken = await storage.getItem("access-token");
    String refreshToken = await storage.getItem("refresh-token");

    return {
      "Content-Type": "application/json",
      "access-token": accessToken,
      "refresh-token": refreshToken,
    };
  }
}
