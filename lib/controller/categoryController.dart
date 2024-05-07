import 'dart:convert';

import 'package:get/get.dart';
import 'package:la_vapiano/API/Api.dart';
import 'package:http/http.dart' as http;
import 'package:la_vapiano/API/model/CategoryModel.dart';

class CategoryController extends GetxController{
  var isLoading = true.obs;
  CategoryModel? model;

  fetchCategory() async{
    try{
      isLoading(true);
      var response = await http.get(Uri.parse("$API_URL/?action=${ApiAction.GET_CATEGORY}"));
      model = CategoryModel.fromJson(jsonDecode(response.body.toString()));
    }catch(e){
      print(e);
    }
    finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }
}