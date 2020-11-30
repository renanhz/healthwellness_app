import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:healthwellness/services/firebase_service.dart';
import 'package:rxdart/rxdart.dart';

enum LoginState { LOADING, SUCCESS, FAIL }

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

  FirebaseService firebaseService =
      GetIt.I.get<FirebaseService>(instanceName: 'firebaseService');

  void checkButtonDisable() {
    String email = _emailController.value;
    String password = _passController.value;

    print(email + ' - ' + password);

    if (email.isNotEmpty && password.isNotEmpty && password.length > 6) {
      inButtonDisable.add(false);
    } else {
      inButtonDisable.add(true);
    }
  }

  Future<void> login() async {
    _loginController.sink.add(LoginState.LOADING);

    String email = _emailController.value;
    String password = _passController.value;

    firebaseService.login(email, password).then((User user) {
      //baixar informações do usuário
      _loginController.sink.add(LoginState.SUCCESS);
    }).catchError((FirebaseAuthException e) {
      _loginController.sink.add(LoginState.FAIL);
    });
  }

  @override
  void dispose() {
    _emailController.close();
    _passController.close();
    _buttonDisableController.close();
    _loginController.close();

    super.dispose();
  }
}
