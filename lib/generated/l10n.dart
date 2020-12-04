// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Health & Wellness`
  String get appName {
    return Intl.message(
      'Health & Wellness',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Health and Wellness is a personal medical record control system, in which it seeks to give you the opportunity to carry with you all your consultation and examination history, bringing the convenience and freedom of migrating from hospitals / doctors taking all your health history.`
  String get about {
    return Intl.message(
      'Health and Wellness is a personal medical record control system, in which it seeks to give you the opportunity to carry with you all your consultation and examination history, bringing the convenience and freedom of migrating from hospitals / doctors taking all your health history.',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Developed By André, Eduardo, Lucas, Renan`
  String get developedBy {
    return Intl.message(
      'Developed By André, Eduardo, Lucas, Renan',
      name: 'developedBy',
      desc: '',
      args: [],
    );
  }

  /// `© 2020 Copyright: health-wellness.com`
  String get copyright {
    return Intl.message(
      '© 2020 Copyright: health-wellness.com',
      name: 'copyright',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get portuguese {
    return Intl.message(
      'Portuguese',
      name: 'portuguese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email/Password`
  String get loginError {
    return Intl.message(
      'Invalid Email/Password',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `Exams`
  String get exams {
    return Intl.message(
      'Exams',
      name: 'exams',
      desc: '',
      args: [],
    );
  }

  /// `Logout?`
  String get logoutAlertTitle {
    return Intl.message(
      'Logout?',
      name: 'logoutAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Go back to about screen`
  String get logoutAlertText {
    return Intl.message(
      'Go back to about screen',
      name: 'logoutAlertText',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while trying to log out`
  String get logoutError {
    return Intl.message(
      'An error occurred while trying to log out',
      name: 'logoutError',
      desc: '',
      args: [],
    );
  }

  /// `Symptoms`
  String get symptoms {
    return Intl.message(
      'Symptoms',
      name: 'symptoms',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while trying to download Appointment Details`
  String get appointmentDetailError {
    return Intl.message(
      'An error occurred while trying to download Appointment Details',
      name: 'appointmentDetailError',
      desc: '',
      args: [],
    );
  }

  /// `Dr(a). info`
  String get docInfo {
    return Intl.message(
      'Dr(a). info',
      name: 'docInfo',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get na {
    return Intl.message(
      'N/A',
      name: 'na',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis`
  String get diagnosis {
    return Intl.message(
      'Diagnosis',
      name: 'diagnosis',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `New Exam`
  String get newExam {
    return Intl.message(
      'New Exam',
      name: 'newExam',
      desc: '',
      args: [],
    );
  }

  /// `Pick a Date`
  String get pickDate {
    return Intl.message(
      'Pick a Date',
      name: 'pickDate',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}