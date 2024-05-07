import 'package:flutter/cupertino.dart';

class LanguageCodeProvider extends ChangeNotifier{

  String? _languageCde;

 String? get languageCode => _languageCde;


  void setLanguageCode(String language){
    _languageCde = language;
    notifyListeners();
  }

}