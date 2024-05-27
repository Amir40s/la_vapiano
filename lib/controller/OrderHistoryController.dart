import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/API/Api.dart';
import 'package:http/http.dart' as http;
import 'package:la_vapiano/API/model/OrderHistoryModel.dart';
import 'package:provider/provider.dart';

import '../model/login_model.dart';
import '../shared_preference/shared_preference_provider.dart';

class OrderHistoryController extends GetxController{
  var isLoading = true.obs;
  OrderHistoryModel? historyModel;

  final BuildContext context;

  OrderHistoryController(this.context);

  fetchCarts() async{

    Future<LoginModel?> model = Provider.of<SharedPreferenceProvider>(context,listen: false).getUserData(PrefKey.userLoginData);
    model.then((value) async{
      print(value?.username);
      print(value?.mobile);

      try{
        isLoading(true);
        var response = await http.get(Uri.parse("$API_URL/?action=get-history&username=${value?.username}&mobile=${value?.mobile}"));
        historyModel = OrderHistoryModel.fromJson(jsonDecode(response.body.toString()));

        print(model);
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
    fetchCarts();
    super.onInit();
  }
}