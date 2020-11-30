import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext mainContext) {
    final LangBloc langBloc = BlocProvider.getBloc<LangBloc>();

    return StreamBuilder(
      initialData: 'en',
      stream: langBloc.outLocale,
      builder: (langContext, snapshot) {
        return MaterialApp(
          home: Scaffold(),
        );
      },
    );
  }
}
