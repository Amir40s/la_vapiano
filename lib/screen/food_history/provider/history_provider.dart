import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../API/Api.dart';
import 'package:http/http.dart' as http;

class HistoryProvider extends ChangeNotifier{


  var _data = [];

  get data => _data;


  Future<void> getCategoriesNames() async {

    final params = {
      "username" : "rehman",
      "mobile" : "03414173985",

    };

    print(params);
    final response = await http.get(
      Uri.parse("${API_URL}/action=${ApiAction.GET_HISTORY}&username=rehman&mobile=03167384285"),
    );

    var data = jsonDecode(response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(data["orders"]);
      print("success");
      _data = data["orders"];

      // for (Map i in data) {
      //   print("Running");
      //   _categories.add(CategoryModel.fromJson(i));
      //}
      notifyListeners();
    }
  }
}