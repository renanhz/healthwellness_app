import 'package:flutter/material.dart';
import 'package:healthwellness/models/appointment_model.dart';

Widget getAppointmentCard(
    BuildContext mainContext, AppointmentModel appointment) {
  return Card(
    elevation: 4.0,
    child: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                appointment.title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                appointment.date,
                style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
              )
            ],
          )
        ],
      ),
    ),
  );
}
