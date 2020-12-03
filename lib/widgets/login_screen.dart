import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/bloc/login_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:healthwellness/utils/state_enum.dart';
import 'package:healthwellness/widgets/home_screen.dart';
import 'lang_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext mainContext) {
    final LangBloc langBloc = BlocProvider.getBloc<LangBloc>();
    final LoginBloc loginBloc = BlocProvider.getBloc<LoginBloc>();

    return StreamBuilder(
      initialData: 'en',
      stream: langBloc.outLocale,
      builder: (langContext, snapshot) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.red[600],
              title: Text(S.of(mainContext).signIn),
              actions: [langButton(mainContext)],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                      child: TextField(
                        onChanged: (text) {
                          loginBloc.inEmail.add(text);
                          loginBloc.checkButtonDisable();
                        },
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 20.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          labelText: S.of(mainContext).email,
                        ),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                      child: TextField(
                        onChanged: (text) {
                          loginBloc.inPass.add(text);
                          loginBloc.checkButtonDisable();
                        },
                        obscureText: true,
                        style: TextStyle(fontSize: 20.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          labelText: S.of(mainContext).password,
                        ),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  StreamBuilder(
                    stream: loginBloc.outLoginState,
                    builder: (loginStateContext, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == LoginState.LOADING) {
                          return Center(
                            heightFactor: 2,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.red[600]),
                            ),
                          );
                        } else if (snapshot.data == LoginState.FAIL) {
                          return Center(
                            heightFactor: 2,
                            child: Text(
                              S.of(mainContext).loginError,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20.0,
                              ),
                            ),
                          );
                        } else if (snapshot.data == LoginState.SUCCESS) {
                          Future.delayed(Duration.zero, () {
                            Navigator.pushNamedAndRemoveUntil(
                                mainContext, 'home', (route) => false);
                          });
                        }
                      }
                      return Container();
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  StreamBuilder(
                    initialData: true,
                    stream: loginBloc.outButtonDisable,
                    builder: (buttonDisableContext, snapshot) {
                      return FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Colors.red,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.grey[300],
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.redAccent,
                        onPressed: snapshot.data
                            ? null
                            : () {
                                loginBloc.login();
                              },
                        child: Text(
                          S.of(mainContext).enter,
                          style: TextStyle(fontSize: 30.0),
                        ),
                      );
                    },
                  )
                ],
              ),
            ));
      },
    );
  }
}
