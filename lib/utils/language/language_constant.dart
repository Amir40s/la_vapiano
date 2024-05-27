import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'applocalization.dart';

const String LAGUAGE_CODE = 'languageCode';

///languages code

const String ENGLISH = 'en';

const String ARABIC = 'ar';

const String KHURDI = 'ku';

/// To store and save the selected language according to the language code

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString(LAGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";

  return _locale(languageCode);
}

// switch statements

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');


    case ARABIC:
      return Locale(ARABIC, "SA");

    case KHURDI:
      return Locale(KHURDI, "IR");

    default:
      return Locale(ENGLISH, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}