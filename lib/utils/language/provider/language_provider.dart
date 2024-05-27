import 'package:flutter/material.dart';

import '../applocalization.dart';
class LanguageProvider with ChangeNotifier {

  Locale _locale = Locale('en','US');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    AppLocalizations(locale).load();
   // setLocale(locale);
    notifyListeners();
  }
}