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

      var appointmentList = new List<AppointmentModel>();

      for (dynamic item in body) {
        AppointmentModel appointment = AppointmentModel.fromJson(item);
        appointmentList.add(appointment);
      }

      return appointmentList;
    } else {
      throw Exception();
    }
  }

  Future<AppointmentModel> downloadAppointment(int appointmentId) async {
    Map<String, String> headers = this.buildHeaders();

    final response = await client.get(
        API_ENDPOINT + API_APPOINTMENT + appointmentId.toString(),
        headers: headers);

    if (response.statusCode == 200) {
      dynamic body = json.decode(response.body);
      print(response.body);

      AppointmentModel appointment = AppointmentModel.fromJson(body);
      return appointment;
    } else {
      throw Exception();
    }
  }
}
