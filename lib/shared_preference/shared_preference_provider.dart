import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vapiano/model/login_model.dart';
import 'package:la_vapiano/model/menu_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends ChangeNotifier{
  late SharedPreferences _prefs;
  late Future<void> _prefsInitialization;




  SharedPreferenceProvider() {
    _prefsInitialization = _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _ensurePrefsInitialized() async {
    await _prefsInitialization;
  }


  // Function to set a String value in SharedPreferences
  Future<void> setStringValue(String key, String value) async {
    // await _ensurePrefsInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    print("save");
    notifyListeners();
  }
  // Function to get a String value from SharedPreferences
  String getStringValue(String key) {
    _ensurePrefsInitialized();

    return _prefs.getString(key) ?? '';
  }

  // Function to set an Integer value in SharedPreferences
  Future<void> setIntValue(String key, int value) async {
    await _prefs.setInt(key, value);
    notifyListeners();
  }

  // Function to get an Integer value from SharedPreferences
  int getIntValue(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  // Function to set a Boolean value in SharedPreferences
  Future<void> setBoolValue(String key, bool value) async {
    await _prefs.setBool(key, value);
    notifyListeners();
  }

  // Function to get a Boolean value from SharedPreferences
  bool getBoolValue(String key) {
    return _prefs.getBool(key) ?? false;
  }

  // Function to set a Map value in SharedPreferences
  Future<void> setUserData(String key,LoginModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String productJson = jsonEncode(userModel.toJson());
    await prefs.setString(key, productJson);
    debugPrint("user model save");
  }

  // Function to get a Map value from SharedPreferences
  Future<LoginModel?> getUserData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productJson = prefs.getString(key);
    if (productJson != null) {
      Map<String, dynamic> json = jsonDecode(productJson);
      return LoginModel.fromJson(json);
    }
    return null;
  }


  // Function to clear a value from SharedPreferences
  Future<void> clearValue(String key) async {
    await _prefs.remove(key);
    notifyListeners();
  }


  // fetch data from model

// Future<LoginModel?> model = shareprefProvider.getUserData(PrefKey.userLoginData);
// model.then((value) {
//   print(value?.username);
//   print(value?.mobile);
//   print(value?.address);
// });
}
