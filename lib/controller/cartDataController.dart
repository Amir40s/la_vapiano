import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/API/Api.dart';
import 'package:http/http.dart' as http;
import 'package:la_vapiano/API/model/CartDataModel.dart';
import 'package:la_vapiano/API/model/CategoryModel.dart';
import 'package:provider/provider.dart';

import '../model/login_model.dart';
import '../shared_preference/shared_preference_provider.dart';

class CartDataController extends GetxController{
  var isLoading = true.obs;
  CartDataModel? cartModel;


  final BuildContext context;
  CartDataController(this.context);
  fetchCarts({required context}) async{


    Future<LoginModel?> model = Provider.of<SharedPreferenceProvider>(context,listen: false).getUserData(PrefKey.userLoginData);
    model.then((value) async{
      print(value?.mobile);

      try{
        isLoading(true);
        var response = await http.get(Uri.parse("$API_URL/?action=${ApiAction.GET_CART}&mobile=${value?.mobile}"));
        cartModel = CartDataModel.fromJson(jsonDecode(response.body.toString()));
      }catch(e){
        print(e);
      }
      finally{
        isLoading(false);
      }

    }).onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
    });



  }

  @override
  void onInit() {
    fetchCarts(context: context);
    super.onInit();
  }
}