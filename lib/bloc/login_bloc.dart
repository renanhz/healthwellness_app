import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

enum LoginState { LOADING, SUCCESS, FAIL }

class LoginBloc extends BlocBase {
  BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  Sink<String> get inEmail => _emailController.sink;

  BehaviorSubject<String> _passController = BehaviorSubject<String>();
  Sink<String> get inPass => _passController.sink;

  BehaviorSubject<LoginState> _loginController = BehaviorSubject<LoginState>();
  Stream<LoginState> get outLoginState => _loginController.stream;

  login() {
    _loginController.sink.add(LoginState.LOADING);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
