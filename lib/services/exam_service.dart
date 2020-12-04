import 'package:healthwellness/models/exam_model.dart';
import 'package:healthwellness/services/base_service.dart';
import 'dart:convert';
import 'package:healthwellness/utils/urls.dart';
import 'package:http/http.dart' show Client;
import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';

class ExamService extends BaseService {
  Client client = Client();
  LocalStorage storage = GetIt.I.get<LocalStorage>(instanceName: 'storage');

  Future<ExamModel> createExam(Map<String, dynamic> exam) async {
    Map<String, String> headers = await this.buildHeaders();

    final response = await client.post(API_ENDPOINT + API_EXAM,
        headers: headers, body: json.encode(exam));

    print("RESPONSE ${json.encode(response.body)}");

    if (response.statusCode == 200) {
      print("EXAME CRIADO");
      dynamic body = json.decode(response.body);

      ExamModel examModel = ExamModel.fromJson(body['data']);
      return examModel;
    } else {
      print("EXAME FAIL ${response.statusCode}");
      throw Exception();
    }
  }

  Future<List<ExamModel>> getExamList() async {
    Map<String, String> headers = await this.buildHeaders();
    int patientId = storage.getItem("patientId");

    final response =
        await client.get("$API_ENDPOINT$API_EXAM/$patientId", headers: headers);

    if (response.statusCode == 200) {
      dynamic body = json.decode(response.body);

      var examList = new List<ExamModel>();

      for (dynamic item in body['data']) {
        ExamModel exam = ExamModel.fromJson(item);

        examList.add(exam);
      }

      return examList;
    } else {
      print("ERRO API GET EXAM LIST");
      throw Exception();
    }
  }
}
