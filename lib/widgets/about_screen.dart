import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                        Text("HEALTH & WELLNESS",
                            style: GoogleFonts.staatliches(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.0))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    "O Health and Wellness é um sistema de controle de prontuário pessoal, no qual busca dar a oportunidade de carregar consigo mesmo todo seu histórico de consulta e exame, trazendo a comodidade e liberdade de migrar de hospitais/médicos levando todos seus antecedentes de saúde.",
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                    ),
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
                  Text(
                      "Desenvolvido por: André, Eduardo, Lucas e Renan.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.teko(
                      textStyle:
                      TextStyle(color: Colors.black, fontSize: 18.0))),
                  SizedBox(height: 1),
                  Text("© 2020 Copyright: health-wellness.com",
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
