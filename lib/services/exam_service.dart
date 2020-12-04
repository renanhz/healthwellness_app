import 'package:healthwellness/models/exam_model.dart';
import 'package:healthwellness/services/base_service.dart';
import 'dart:convert';
import 'package:healthwellness/utils/urls.dart';
import 'package:http/http.dart' show Client;

class ExamService extends BaseService {
  Client client = Client();

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
}
