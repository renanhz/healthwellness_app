import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/login_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';

Widget logoutButton(BuildContext mainContext) {
  final LoginBloc loginBloc = BlocProvider.getBloc<LoginBloc>();

  return IconButton(
      icon: Icon(Icons.logout, size: 20.0),
      onPressed: () {
        showDialog(
            context: mainContext,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(S.of(mainContext).logoutAlertTitle),
                content: Text(S.of(mainContext).logoutAlertText),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(S.of(mainContext).cancel)),
                  FlatButton(
                      onPressed: () async {
                        await loginBloc.logout();
                        Navigator.of(context).pop();
                        Navigator.of(mainContext)
                            .pushNamedAndRemoveUntil("about", (route) => false);
                      },
                      child: Text(S.of(mainContext).ok)),
                ],
              );
            });
      });
}
