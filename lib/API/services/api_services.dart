
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:la_vapiano/API/model/SubCategoryModel.dart';
import 'package:http/http.dart' as http;
import 'package:la_vapiano/API/model/product_model.dart';

import '../Api.dart';

class ApiServices{


  Future<List<SubCategoryModel>> fetchSubcategory({required menuName}) async{
    print("FoodName: ${menuName}");
    var response = await http.get(Uri.parse("$API_URL/?action=${ApiAction.GET_SUB_CATEGORY}&category=$menuName"));
    if(response.statusCode == 200){
      return subCategoryModelFromJson(response.body);
    }else{
      throw Exception('Failed to load subcategory');
    }
  }

  Future<List<ProductModel>> fetchProducts({required menuName}) async{
    print("FoodName in Product Function: ${menuName}");
    log("////////////////////////////////  $menuName");
    try{
      var response = await http.get(Uri.parse("$API_URL/?action=${ApiAction.GET_FOOD_LIST}&category=$menuName"));

      print("Response: ${response.body}");
      log("////////////////////////////////  ${response.statusCode}");
      if(response.statusCode == 200){
        return productModelFromJson(response.body);
      }else{
        throw Exception('Failed to load Product Function');
      }
    }catch(e){
      if (kDebugMode) {
        print("Exception: "+e.toString());
      }
      throw Exception('Failed to load Product Function in catch');
    }
  }

  Future<List<ProductModel>> fetchFilterProducts({required menuName,subCatMenu}) async{
    print("FoodName in Product Function: ${menuName}");
    try{
      var response = await http.get(Uri.parse("$API_URL/?action=${ApiAction.GET_FOOD_LIST}&category=$menuName&subcategory=$subCatMenu"));

      print("Response: ${response.body}");
      if(response.statusCode == 200){
        return productModelFromJson(response.body);
      }else{
        throw Exception('Failed to load Product Function');
      }
    }catch(e){
      if (kDebugMode) {
        print("Exception: "+e.toString());
      }
      throw Exception('Failed to load Product Function in catch');
    }
  }

}