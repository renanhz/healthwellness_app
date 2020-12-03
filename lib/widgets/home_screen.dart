import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/home_navigation_bloc.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/bloc/login_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:healthwellness/widgets/logout_button.dart';

import 'appointment_list_screen.dart';
import 'lang_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext mainContext) {
    final LangBloc langBloc = BlocProvider.getBloc<LangBloc>();
    final HomeNavigationBloc navigationBloc =
        BlocProvider.getBloc<HomeNavigationBloc>();
    final PageController _pageController = PageController();

    return StreamBuilder(
      initialData: 'en',
      stream: langBloc.outLocale,
      builder: (langContext, snapshot) {
        print(MaterialLocalizations.of(mainContext));
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[600],
            title: Text(S.of(mainContext).home),
            actions: [langButton(mainContext), logoutButton(mainContext)],
          ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: <Widget>[
              AppointmentListScreen(),
            ],
          ),
          bottomNavigationBar: StreamBuilder(
              stream: navigationBloc.outPage,
              initialData: 0,
              builder: (context, snapshot) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    currentIndex: snapshot.data,
                    onTap: (index) {
                      navigationBloc.changePage(_pageController, index);
                    },
                    fixedColor: Colors.white,
                    iconSize: 25.0,
                    backgroundColor: Colors.red[600],
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.date_range),
                          label: S.of(mainContext).appointments),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.description_outlined),
                          label: S.of(mainContext).exams),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
