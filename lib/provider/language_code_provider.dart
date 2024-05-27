

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/language/applocalization.dart';

class LanguageCodeProvider extends ChangeNotifier{

  String? _languageCde;
  String? _screenStatus;

 String? get languageCode => _languageCde;
 String? get screenStatus => _screenStatus;


  void setLanguageCode(String language){
    _languageCde = language;
    notifyListeners();
  }

  void setScreenStatus(String status){
    _screenStatus = status;
    notifyListeners();
  }


}