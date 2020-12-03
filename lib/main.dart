import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:healthwellness/bloc/appointment_bloc.dart';
import 'package:healthwellness/bloc/home_navigation_bloc.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/bloc/login_bloc.dart';
import 'package:healthwellness/services/appointment_service.dart';
import 'package:healthwellness/services/firebase_service.dart';
import 'package:healthwellness/services/patient_service.dart';
import 'package:healthwellness/widgets/about_screen.dart';
import 'package:healthwellness/widgets/home_screen.dart';
import 'package:healthwellness/widgets/login_screen.dart';
import 'package:localstorage/localstorage.dart';

import 'generated/l10n.dart';

Future<void> setup() async {
  await Firebase.initializeApp();

  GetIt.I.registerSingleton<FirebaseService>(FirebaseService(),
      instanceName: 'firebaseService');

  GetIt.I.registerSingleton<PatientService>(PatientService(),
      instanceName: 'patientService');

  GetIt.I.registerSingleton<AppointmentService>(AppointmentService(),
      instanceName: 'appointmentService');
}

String getRoute() {
  LocalStorage storage = new LocalStorage('hw');

  String route = "about";
  String uid = storage.getItem('access-token');

  if (uid != null) {
    route = "home";
  }

  return route;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  String firstRoute = getRoute();

  runApp(BlocProvider(
      blocs: [
        Bloc((i) => LangBloc()),
        Bloc((i) => LoginBloc()),
        Bloc((i) => HomeNavigationBloc()),
        Bloc((i) => AppointmentBloc())
      ],
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: "Health & Wellness",
        initialRoute: "about",
        routes: {
          "about": (context) => AboutScreen(),
          "login": (context) => LoginScreen(),
          "home": (context) => HomeScreen()
        },
      )));
}
