import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/appointment_bloc.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/widgets/appointment_card.dart';

class AppointmentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext mainContext) {
    final LangBloc langBloc = BlocProvider.getBloc<LangBloc>();
    final AppointmentBloc appointmentBloc =
        BlocProvider.getBloc<AppointmentBloc>();

    return StreamBuilder(
        initialData: 'en',
        stream: langBloc.outLocale,
        builder: (context, snapshot) {
          return StreamBuilder(
            initialData: [],
            stream: appointmentBloc.outAppointmentList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return getAppointmentCard(mainContext);
                  },
                );
              }
            },
          );
        });
  }
}
