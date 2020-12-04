import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:healthwellness/models/exam_model.dart';
import 'package:healthwellness/services/exam_service.dart';
import 'package:healthwellness/services/firebase_service.dart';
import 'package:healthwellness/utils/state_enum.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rxdart/rxdart.dart';

class ExamBloc extends BlocBase {
  BehaviorSubject<String> _nameController = BehaviorSubject<String>();
  Sink<String> get inName => _nameController.sink;

  BehaviorSubject<bool> _sendButtonStateController = BehaviorSubject<bool>();
  Sink<bool> get inButtonState => _sendButtonStateController.sink;
  Stream<bool> get outButtonState => _sendButtonStateController.stream;

  BehaviorSubject<DateTime> _creationDateController =
      BehaviorSubject<DateTime>.seeded(DateTime.now());
  Sink<DateTime> get inCreationDate => _creationDateController.sink;
  Stream<DateTime> get outCreationDate => _creationDateController.stream;

  BehaviorSubject<String> _fileNameController = BehaviorSubject<String>();
  Sink<String> get inFileName => _fileNameController.sink;
  Stream<String> get outFileName => _fileNameController.stream;

  BehaviorSubject<String> _filePathController = BehaviorSubject<String>();
  Sink<String> get inFilePath => _filePathController.sink;

  BehaviorSubject<NewExamState> _newExamStateController =
      BehaviorSubject<NewExamState>();
  Sink<NewExamState> get inNewExamState => _newExamStateController.sink;
  Stream<NewExamState> get outNewExamState => _newExamStateController.stream;

  BehaviorSubject<ExamListState> _examListStateController =
      BehaviorSubject<ExamListState>();
  Sink<ExamListState> get inExamListState => _examListStateController.sink;
  Stream<ExamListState> get outExamListState => _examListStateController.stream;

  BehaviorSubject<List<ExamModel>> _examListController =
      BehaviorSubject<List<ExamModel>>();
  Sink<List<ExamModel>> get inExamList => _examListController.sink;
  Stream<List<ExamModel>> get outExamList => _examListController.stream;

  FirebaseService firebaseService =
      GetIt.I.get<FirebaseService>(instanceName: 'firebaseService');

  LocalStorage storage = GetIt.I.get<LocalStorage>(instanceName: 'storage');

  ExamService examService =
      GetIt.I.get<ExamService>(instanceName: 'examService');

  Future<void> selectFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      inFileName.add(file.name);
      inFilePath.add(file.path);
    }
  }

  void checkButtonState() {
    String name = _nameController.value;
    String fileName = _fileNameController.value;

    if (name.isNotEmpty && fileName.isNotEmpty) {
      inButtonState.add(false);
    } else {
      inButtonState.add(true);
    }
  }

  Future<void> save() async {
    inNewExamState.add(NewExamState.LOADING);

    String filePath = _filePathController.value;
    String fileName = _fileNameController.value;

    int patientId = storage.getItem("patientId");
    String name = _nameController.value;
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(_creationDateController.value);
    print("DATE: $formattedDate");

    firebaseService.uploadFile(filePath, fileName).then((String firebasePath) {
      Map<String, dynamic> exam = {
        "creation_date": formattedDate,
        "name": name,
        "file_path": firebasePath,
        "patient": patientId
      };

      examService.createExam(exam).then((ExamModel examModel) {
        inNewExamState.add(NewExamState.SUCCESS);
      }).catchError((e) {
        print("ERRO API");
        inNewExamState.add(NewExamState.FAIL);
      });
    }).catchError((e) {
      print("ERRO FIREBASE");
      inNewExamState.add(NewExamState.FAIL);
    });
  }

  Future<void> downloadExamList() async {
    inExamListState.add(ExamListState.LOADING);

    examService.getExamList().then((List<ExamModel> examList) {
      inExamList.add(examList);
      inExamListState.add(ExamListState.SUCCESS);
    }).catchError((e) {
      inExamListState.add(ExamListState.FAIL);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.close();
    _sendButtonStateController.close();
    _creationDateController.close();
  }
}
