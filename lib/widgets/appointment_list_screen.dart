import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/appointment_bloc.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/utils/state_enum.dart';
import 'package:healthwellness/widgets/appointment_card.dart';

class AppointmentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext mainContext) {
    final LangBloc langBloc = BlocProvider.getBloc<LangBloc>();
    final AppointmentBloc appointmentBloc =
        BlocProvider.getBloc<AppointmentBloc>();

    appointmentBloc.downloadAppointmentList();

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
