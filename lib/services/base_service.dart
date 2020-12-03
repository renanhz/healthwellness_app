import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' show Client;

class BaseService {
  Client client = Client();
  LocalStorage storage = new LocalStorage('hw');

  Map<String, String> buildHeaders() {
    String accessToken = storage.getItem("access-token");
    String refreshToken = storage.getItem("refresh-token");

    return {
      "Content-Type": "application/json",
      "access-token": accessToken,
      "refresh-token": refreshToken,
    };
  }
}
