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