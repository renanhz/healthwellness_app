import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/login_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:healthwellness/utils/login_state_enum.dart';

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
                content: StreamBuilder(
                  initialData: null,
                  stream: loginBloc.outLogoutState,
                  builder: (context, snapshot) {
                    switch (snapshot.data) {
                      case LogoutState.LOADING:
                        return Center(
                          heightFactor: 2,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.red[600]),
                          ),
                        );
                        break;
                      case LogoutState.FAIL:
                        return Text(S.of(mainContext).logoutError);
                        break;
                      default:
                        return Text(S.of(mainContext).logoutAlertText);
                    }
                  },
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(S.of(mainContext).cancel)),
                  FlatButton(
                      onPressed: () async {
                        loginBloc.logout().then((value) {
                          Navigator.of(context).pop();
                          Navigator.of(mainContext).pushNamedAndRemoveUntil(
                              "about", (route) => false);
                        }).catchError((e) {});
                      },
                      child: Text(S.of(mainContext).ok)),
                ],
              );
            });
      });
}
