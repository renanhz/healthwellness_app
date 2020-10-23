import 'package:flutter/material.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          title: Text(S.of(context).aboutUs),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('lib/assets/img/logo.png'),
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
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    S.of(context).about,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.teko(
                        textStyle:
                            TextStyle(fontSize: 25.0, color: Colors.grey[600])),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  FlatButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.redAccent,
                    onPressed: () {
                      /*...*/
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  SizedBox(height: 100),
                  Text(S.of(context).developedBy,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.teko(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 18.0))),
                  SizedBox(height: 1),
                  Text(S.of(context).copyright,
                      style: GoogleFonts.teko(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 18.0)))
                ],
              ),
            ),
          ],
        ));
  }
}
