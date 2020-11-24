import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rxdart/subjects.dart';
import 'dart:async';

class LangBloc extends BlocBase {
  final BehaviorSubject<String> _localeController =
      BehaviorSubject<String>.seeded("en");

  Stream<String> get outLocale => _localeController.stream;
  Sink<String> get inLocale => _localeController.sink;

  LocalStorage storage = new LocalStorage('hw');

  changeLocale(String locale) {
    inLocale.add(locale);

    S.load(Locale(locale));

    storage.setItem('lang', locale);
  }

  getLocale() {
    String locale = storage.getItem('lang') ?? 'en';

    S.load(Locale(locale));
  }

  @override
  void dispose() {
    _localeController.close();
    super.dispose();
  }
}
