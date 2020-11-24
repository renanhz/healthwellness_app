import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'lang_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LangBloc langBloc = BlocProvider.getBloc<LangBloc>();

    return StreamBuilder(
      initialData: 'en',
      stream: langBloc.outLocale,
      builder: (context, snapshot) {
        return MaterialApp(
            home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.red[600],
            title: Text(S.of(context).signIn),
            actions: [langButton(context)],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      labelText: S.of(context).email,
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(fontSize: 20.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      labelText: S.of(context).password,
                    ),
                  )),
              SizedBox(
                height: 50.0,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: Colors.red,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.redAccent,
                onPressed: () {},
                child: Text(
                  S.of(context).enter,
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
