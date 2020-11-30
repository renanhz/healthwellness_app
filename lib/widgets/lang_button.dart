import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';

Widget langButton(BuildContext context) {
  final LangBloc langBloc = BlocProvider.getBloc<LangBloc>();

  return PopupMenuButton(
      icon: Icon(Icons.translate, size: 20.0),
      onSelected: (String locale) {
        langBloc.changeLocale(locale);
      },
      itemBuilder: (_) => <PopupMenuItem<String>>[
            PopupMenuItem<String>(
              child: Text(S.of(context).english),
              value: 'en',
            ),
            PopupMenuItem<String>(
              child: Text(S.of(context).portuguese),
              value: 'pt',
            )
          ]);
}
