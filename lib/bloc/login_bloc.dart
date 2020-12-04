import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:healthwellness/models/patient_model.dart';
import 'package:healthwellness/services/firebase_service.dart';
import 'package:healthwellness/services/patient_service.dart';
import 'package:healthwellness/utils/state_enum.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  Sink<String> get inEmail => _emailController.sink;

  BehaviorSubject<String> _passController = BehaviorSubject<String>();
  Sink<String> get inPass => _passController.sink;

  BehaviorSubject<bool> _buttonDisableController = BehaviorSubject<bool>();
  Sink<bool> get inButtonDisable => _buttonDisableController.sink;
  Stream<bool> get outButtonDisable => _buttonDisableController.stream;

  BehaviorSubject<LoginState> _loginController = BehaviorSubject<LoginState>();
  Stream<LoginState> get outLoginState => _loginController.stream;

  BehaviorSubject<LogoutState> _logoutController =
      BehaviorSubject<LogoutState>();
  Stream<LogoutState> get outLogoutState => _logoutController.stream;

  FirebaseService firebaseService =
      GetIt.I.get<FirebaseService>(instanceName: 'firebaseService');

  PatientService patientService =
      GetIt.I.get<PatientService>(instanceName: 'patientService');

  LocalStorage storage = GetIt.I.get<LocalStorage>(instanceName: 'storage');

  void checkButtonDisable() {
    String email = _emailController.value;
    String password = _passController.value;

    if (email.isNotEmpty && password.isNotEmpty && password.length >= 6) {
      inButtonDisable.add(false);
    } else {
      inButtonDisable.add(true);
    }
  }

  Future<void> login() async {
    _loginController.sink.add(LoginState.LOADING);

    String email = _emailController.value;
    String password = _passController.value;

    firebaseService.login(email, password).then((val) {
      patientService.getPatient().then((PatientModel patient) {
        storage.setItem("patientId", patient.id);

        _loginController.sink.add(LoginState.SUCCESS);
      }).catchError((e) {
        _loginController.sink.add(LoginState.FAIL);
      });
    }).catchError((e) {
      _loginController.sink.add(LoginState.FAIL);
    });
  }

  Future<void> logout() async {
    _logoutController.sink.add(LogoutState.LOADING);

    firebaseService.logout().then((val) {
      _logoutController.sink.add(LogoutState.SUCCESS);
      _loginController.sink.add(null);
      _logoutController.sink.add(null);
    }).catchError((e) {
      print(e);
      _logoutController.sink.add(LogoutState.FAIL);
    });
  }

  @override
  void dispose() {
    _emailController.close();
    _passController.close();
    _buttonDisableController.close();
    _loginController.close();
    _logoutController.close();

    super.dispose();
  }
}
