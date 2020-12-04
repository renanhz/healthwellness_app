import 'package:get_it/get_it.dart';
import 'package:healthwellness/models/patient_model.dart';
import 'package:healthwellness/services/base_service.dart';
import 'package:healthwellness/utils/urls.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class PatientService extends BaseService {
  Client client = Client();
  LocalStorage storage = GetIt.I.get<LocalStorage>(instanceName: 'storage');

  Future<PatientModel> getPatient() async {
    Map<String, String> headers = await this.buildHeaders();

    final response =
        await client.get(API_ENDPOINT + API_PATIENT, headers: headers);

    if (response.statusCode == 200) {
      dynamic body = json.decode(response.body);

      return PatientModel.fromJson(body['data']);
    } else {
      throw Exception();
    }
  }
}
