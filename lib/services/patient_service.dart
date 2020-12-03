import 'package:healthwellness/models/patient_model.dart';
import 'package:healthwellness/utils/urls.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class PatientService {
  Client client = Client();
  LocalStorage storage = new LocalStorage('hw');

  Future<PatientModel> getPatient() async {
    String accessToken = storage.getItem("access-token");
    String refreshToken = storage.getItem("refresh-token");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "access-token": accessToken,
      "refresh-token": refreshToken,
    };

    final response =
        await client.get(API_ENDPOINT + API_PATIENT, headers: headers);

    if (response.statusCode == 200) {
      dynamic body = json.decode(response.body);
      print(body);

      return PatientModel();
    } else {
      throw Exception();
    }
  }
}
