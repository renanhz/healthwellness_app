import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/appointment_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:healthwellness/models/appointment_model.dart';
import 'package:healthwellness/utils/state_enum.dart';

Widget getAppointmentCard(BuildContext mainContext,
    AppointmentModel appointment, AppointmentBloc appointmentBloc) {
  return GestureDetector(
      onTap: () {
        appointmentBloc.downloadAppointmentDetail(appointment.id);
        showDialog(
            context: mainContext,
            builder: (context) {
              return Dialog(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: StreamBuilder(
                  stream: appointmentBloc.outAppointmentDetailState,
                  builder: (context, snapshot) {
                    if (snapshot.data == AppointmentDetailState.LOADING) {
                      return Container(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            heightFactor: 2,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.red[600]),
                            ),
                          ));
                    } else if (snapshot.data == AppointmentDetailState.FAIL) {
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          heightFactor: 2,
                          child: Text(
                            S.of(mainContext).appointmentDetailError,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.data ==
                        AppointmentDetailState.SUCCESS) {
                      return StreamBuilder(
                          stream: appointmentBloc.outAppointmentDetail,
                          builder: (context, snapshot) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            snapshot.data.title,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data.date,
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 12.0),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: Divider(
                                          color: Colors.grey[400],
                                          height: 1.0,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          S.of(mainContext).docInfo,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 10.0),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Dr(a). ${snapshot.data.doctor['name']}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.contact_phone),
                                                  Text(
                                                      "${snapshot.data.doctor['contact']}")
                                                ],
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            );
                          });
                    }

                    return Container();
                  },
                ),
              );
            });
      },
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
