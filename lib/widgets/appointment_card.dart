import 'package:flutter/material.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:healthwellness/models/appointment_model.dart';

Widget getAppointmentCard(
    BuildContext mainContext, AppointmentModel appointment) {
  return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    appointment.date,
                    style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(
                  color: Colors.grey[400],
                  height: 1.0,
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Dr(a). ${appointment.doctor['name']}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
