import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthwellness/widgets/lang_button.dart';
import 'package:healthwellness/widgets/login_screen.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LangBloc langBloc = BlocProvider.getBloc<LangBloc>();

    return StreamBuilder(
        stream: langBloc.outLocale,
        initialData: 'en',
        builder: (context, snapshot) {
          return MaterialApp(
              home: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.red[600],
                    title: Text(S.of(context).aboutUs),
                    actions: [langButton(context)],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('lib/assets/img/logo.png'),
                                      height: 100,
                                      width: 100,
                                    ),
                                    Text(S.of(context).appName,
                                        style: GoogleFonts.staatliches(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30.0))),
                                  ],
                                )),
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
                              alignment: Alignment.center,
                              child: Text(
                                S.of(context).about,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.teko(
                                    textStyle: TextStyle(
                                        fontSize: 24.0,
                                        color: Colors.grey[600])),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: Colors.red,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.redAccent,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                S.of(context).login,
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              Text(S.of(context).developedBy,
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.teko(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0))),
                              SizedBox(height: 1),
                              Text(S.of(context).copyright,
                                  style: GoogleFonts.teko(
                                      textStyle: TextStyle(
                                          color: Colors.black, fontSize: 18.0)))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )));
        });
  }
}
