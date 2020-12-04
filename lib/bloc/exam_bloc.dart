import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rxdart/rxdart.dart';

class ExamBloc extends BlocBase {
  BehaviorSubject<String> _nameController = BehaviorSubject<String>();
  Sink<String> get inName => _nameController.sink;

  BehaviorSubject<bool> _sendButtonStateController = BehaviorSubject<bool>();
  Sink<bool> get inButtonState => _sendButtonStateController.sink;
  Stream<bool> get outButtonState => _sendButtonStateController.stream;

  BehaviorSubject<DateTime> _creationDateController =
      BehaviorSubject<DateTime>();
  Sink<DateTime> get inCreationDate => _creationDateController.sink;
  Stream<DateTime> get outCreationDate => _creationDateController.stream;

  Future<void> selectFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.path);
    }
  }

  void checkButtonState() {}

  @override
  void dispose() {
    super.dispose();
    _nameController.close();
    _sendButtonStateController.close();
    _creationDateController.close();
  }
}
