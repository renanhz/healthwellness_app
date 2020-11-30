import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/widgets/about_screen.dart';

import 'generated/l10n.dart';

void main() {
  runApp(BlocProvider(
      blocs: [Bloc((i) => LangBloc())],
      child: MaterialApp(
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        title: "Health & Wellness",
        home: AboutScreen(),
      )));
}
