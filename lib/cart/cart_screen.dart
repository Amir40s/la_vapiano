import 'dart:convert';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:la_vapiano/controller/cartDataController.dart';
import 'package:la_vapiano/provider/value_provider.dart';
import 'package:la_vapiano/screen/food_history/food_history_screen.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_loading_widget.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../API/Api.dart';

import '../model/login_model.dart';
import 'package:http/http.dart' as http;
import '../provider/language_code_provider.dart';
import '../shared_preference/shared_preference_provider.dart';
import '../widget/menu_container.dart';
class CartScreen extends StatelessWidget {
   CartScreen({super.key});



  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartDataController(context));
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    final loadingProvider = Provider.of<ValueProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          provider.languageCode == "en"? "Cart" : provider.languageCode == "ku"? "سبد خرید" : "سبد خرید",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  FirebaseAuth.instance.currentUser?.uid !=null ?  Obx(() {
                    if(cartController.isLoading.value){
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.red,),
                      );
                    }
                    if(cartController.cartModel!.data!.length >0){
                      return DynamicHeightGridView(
                        itemCount: cartController.cartModel!.data!.length,
                        shrinkWrap: true,
                        crossAxisCount: 1,
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                        physics:  BouncingScrollPhysics(),
                        builder: (context,index){
                          return _itemsBuild(context,index,provider,cartController);
                        },
                        // builder: (context,index){
                        //   return Container(
                        //     margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
                        //     child: GestureDetector(
                        //         onTap: (){
                        //          // Get.to(HomeScreen(menuName: categoryController.model!.data![index].en.toString(),));
                        //         },
                        //         child: MenuContainer(
                        //           isTransparent: true,
                        //           text:
                        //           provider.languageCode == "en" ? cartController.model!.data![index].en.toString()
                        //               :  provider.languageCode == "ku" ? cartController.model!.data![index].ku.toString() :
                        //           cartController.model!.data![index].ar.toString(),
                        //
                        //           image: "$API_IMAGE_URL${cartController.model?.data?[index].image.toString()}",
                        //         )),
                        //   );
                        // }
                      );
                    }else{
                      return Center(
                        child: Text("No Cart Yet"),
                      );
                    }

                  }) : Container(
                    margin: EdgeInsets.all(20.0),
                    child: ButtonWidget(text: "Login to See cart", onClicked: (){
                      Get.to(LoginScreen());
                    }, width: Get.width, height: 50.0),
                  ),
                ],
              ),




              if(FirebaseAuth.instance.currentUser?.uid !=null)
              Container(
                  margin: EdgeInsets.all(10.0),
                  child:

                  loadingProvider.isLoading == false ?
                  ButtonWidget(text: "Place Order", onClicked: (){
                    loadingProvider.setLoading(true);
                    Future<LoginModel?> model = Provider.of<SharedPreferenceProvider>(context,listen: false).getUserData(PrefKey.userLoginData);
                    model.then((value) {
                      print(value?.username);
                      print(value?.mobile);
                      print(value?.address);
                      print(value?.password);
                      placeOrder(
                        username: value?.username,
                        mobile: value?.mobile,
                        address: value?.address,
                        context: context
                      );
                    }).onError((error, stackTrace) {
                      print(error.toString());
                      print(stackTrace.toString());
                    });
                  }, width: Get.width, height: 50.0) : ButtonLoadingWidget(width: Get.width, height: 50.0)
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _itemsBuild(BuildContext context,int index,LanguageCodeProvider provider,CartDataController cartController){
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius:  5,
            offset: Offset( 0 , 3), // changes position of shadow
          ),
        ]
      ),
      child: ListTile(
        leading: Image.network("$API_IMAGE_URL${cartController.cartModel?.data?[index].image.toString()}",width: 50.0,height: Get.height,
        fit: BoxFit.cover,),
        title: Text(
            provider.languageCode == "en" ? cartController.cartModel!.data![index].en.toString()
                        :  provider.languageCode == "ku" ? cartController.cartModel!.data![index].ku.toString() :
                    cartController.cartModel!.data![index].ar.toString(),
        ),
        subtitle: Text(
          maxLines: 1,
          provider.languageCode == "en" ? cartController.cartModel!.data![index].descen.toString()
              :  provider.languageCode == "ku" ? cartController.cartModel!.data![index].descku.toString() :
          cartController.cartModel!.data![index].descar.toString(),style: TextStyle(fontSize: 14.0,color: Colors.grey),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextWidget(text: "QTY: ${ cartController.cartModel!.data![index].orderQty.toString()}", size: 12.0,color: Colors.black,),
            SizedBox(height: 10.0,),
            TextWidget(text: "Price: ${ cartController.cartModel!.data![index].price.toString()}", size: 12.0,color: Colors.red,isBold: true,),
          ],
        ),
      ),
    );
  }

  void placeOrder({required username,required mobile,required address,required context}) async{
    try{

      http.Response response = await http.post(
          Uri.parse(API_URL),
          body: {
            ApiKey.key_action : ApiAction.PLACE_ORDER,
            ApiKey.key_username : username,
            ApiKey.key_mobile : mobile,
            ApiKey.key_address : address,
          }
      );

      var body = jsonDecode(response.body.toString());
      print("Place Order:${body}");

      print(response.statusCode);
      if(response.statusCode == 200){
        Provider.of<ValueProvider>(context,listen: false).setLoading(false);
          Get.snackbar("Order Place successfully", body["success"]);
          Get.to(FoodHistoryScreen());
      }


    }catch(e){
      Provider.of<ValueProvider>(context,listen: false).setLoading(false);
      print(e.toString());
    }
  }
}
