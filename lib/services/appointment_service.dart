import 'package:healthwellness/models/appointment_model.dart';
import 'package:healthwellness/models/patient_model.dart';
import 'package:healthwellness/services/base_service.dart';
import 'package:healthwellness/utils/urls.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

class AppointmentService extends BaseService {
  Client client = Client();
  LocalStorage storage = new LocalStorage('hw');

  Future<List<AppointmentModel>> downloadAppointmentList() async {
    Map<String, String> headers = this.buildHeaders();
    final response =
        await client.get(API_ENDPOINT + API_APPOINTMENT, headers: headers);

    if (response.statusCode == 200) {
      dynamic body = json.decode(response.body);
      print(response.body);
    } else {
      throw Exception();
    }
  }
}
