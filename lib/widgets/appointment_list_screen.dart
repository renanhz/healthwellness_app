import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/appointment_bloc.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/utils/state_enum.dart';
import 'package:healthwellness/widgets/appointment_card.dart';

class AppointmentListScreen extends StatefulWidget {
  @override
  _AppointmentListScreenState createState() => _AppointmentListScreenState();
}

class _AppointmentListScreenState extends State<AppointmentListScreen> {
  LangBloc langBloc;
  AppointmentBloc appointmentBloc;

  @override
  void initState() {
    super.initState();
    this.langBloc = BlocProvider.getBloc<LangBloc>();
    this.appointmentBloc = BlocProvider.getBloc<AppointmentBloc>();

    appointmentBloc.downloadAppointmentList();
  }

  @override
  Widget build(BuildContext mainContext) {
    return StreamBuilder(
        initialData: 'en',
        stream: langBloc.outLocale,
        builder: (context, snapshot) {
          return StreamBuilder(
            stream: appointmentBloc.outAppointmentState,
            builder: (context, snapshot) {
              if (snapshot.data == AppointmentListState.LOADING) {
                return Center(
                  heightFactor: 2,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red[600]),
                  ),
                );
              } else if (snapshot.data == AppointmentListState.FAIL) {
                return Column();
              } else if (snapshot.data == AppointmentListState.SUCCESS) {
                return StreamBuilder(
                  stream: appointmentBloc.outAppointmentList,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return getAppointmentCard(
                            mainContext, snapshot.data[index]);
                      },
                    );
                  },
                );
              }
            },
          );
        });
  }
}
