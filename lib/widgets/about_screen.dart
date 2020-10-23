import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          title: Text("About us"),
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
                        SizedBox(
                          width: 1.0,
                        ),
                        Text("Health & Wellness",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.0)),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    "O Health and Wellness é um sistema de controle de prontuário pessoal, no qual busca dar a oportunidade de carregar consigo mesmo todo seu histórico de consulta e exame, trazendo a comodidade e liberdade de migrar de hospitais/médicos levando todos seus antecedentes de saúde.",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
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
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      /*...*/
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 100),
                  Text(
                      "Developed by: André Lopes, Eduardo Elesbao, Lucas da Cruz e Renan Pereira.",
                      style: TextStyle(color: Colors.black, fontSize: 11.3)),
                  SizedBox(height: 1),
                  Text("© 2020 Copyright: health-wellness.com",
                      style: TextStyle(color: Colors.black, fontSize: 15.0))
                ],
              ),
            ),
          ],
        ));
  }
}
