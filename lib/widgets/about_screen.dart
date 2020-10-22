import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 0.0),
              alignment: Alignment.center,
              child: Text("Health & Wellness",
                  style: TextStyle(color: Colors.red[600], fontSize: 24.0)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              alignment: Alignment.center,
              child: Text(
                "O Health and Wellness é um sistema de controle de prontuário pessoal, no qual busca dar a oportunidade de carregar consigo mesmo todo seu histórico de consulta e exame, trazendo a comodidade e liberdade de migrar de hospitais/médicos levando todos seus antecedentes de saúde.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ));
  }
}
