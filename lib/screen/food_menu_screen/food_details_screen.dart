import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/provider/cart_items_provider.dart';
import 'package:la_vapiano/shared_preference/shared_preference_provider.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_loading_widget.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/custom_textfield.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../../API/Api.dart';
import '../../cart/cart_screen.dart';
import '../../model/login_model.dart';
import '../../provider/language_code_provider.dart';
import 'package:http/http.dart' as http;

import '../../provider/value_provider.dart';
import '../../utils/app_text.dart';

class FoodDetailsScreen extends StatelessWidget {
 final List productList;
 final int index;
   FoodDetailsScreen({super.key, required this.productList, required this.index, });

  var notesController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    final countProvider = Provider.of<CartItemsProvider>(context,listen: false);
    final loadingProvider = Provider.of<ValueProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text( provider.languageCode == "en" ? food_details_en :
        provider.languageCode == "ku" ? food_details_ku : food_details_ar ,style: TextStyle(color: Colors.white),),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          if(provider.screenStatus == "delivery")
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
            Get.to(CartScreen());
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Image.network("$API_IMAGE_URL${productList[index].image}",height: 400.0,width: Get.width,fit: BoxFit.cover,),

            Column(
              children: [
            Padding(padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: provider.languageCode == "en" ? productList[index].en :
                      provider.languageCode == "ku" ? productList[index].ku  : productList[index].ar
        
                        , size: 22.0,color: Colors.white,isBold: true,),
        
                      TextWidget(text: "IQD ${productList[index].price.toString()}", size: 22.0,color: Colors.white,isBold: true,),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                      width: Get.width,
                      child: TextWidget(text: provider.languageCode == "en" ?  productList[index].descen :
                      provider.languageCode == "ku" ?  productList[index].descku  : productList[index].descar
                        , size: 16.0,color: Colors.white,)),
                ],
              ),
            ),
        
        
            SizedBox(height: 10.0,),
            if(provider.screenStatus == "delivery")
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
        
                  Consumer<CartItemsProvider>(
                    builder: (context, provider, child){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Consumer<LanguageCodeProvider>(
                           builder: (context, language, child){
                             return TextWidget(text: language.languageCode == "en" ? quantity_en :
                             language.languageCode == "ku" ? quantity_ku : quantity_ar, size: 16.0,color: Colors.white,);
                           },
                          ),
                          SizedBox(width: 10.0,),
                          GestureDetector(
                              onTap: (){
                                provider.decrement();
                              },
                              child: Icon(Icons.remove_circle,color: primaryColor,)),
                          SizedBox(width: 10.0,),
                          TextWidget(text: provider.count.toString(), size: 16.0,color: Colors.white,),
                          SizedBox(width: 10.0,),
                          GestureDetector(
                              onTap: (){
                                provider.increment();
                              },
                              child: Icon(Icons.add_circle_outlined,color: primaryColor,)),
                        ],
                      );
                    },
                  ),
        
        
                  SizedBox(height: 10.0),
                  if(provider.screenStatus == "delivery")
                  CustomTextField(hintText: provider.languageCode == "en" ? delivery_notes_en :
                  provider.languageCode == "ku" ? delivery_notes_ku : delivery_notes_ar
                      , controller: notesController),
                ],
              ),
            ),
        
            SizedBox(height: 10.0,),
            if(provider.screenStatus == "delivery")
            FirebaseAuth.instance.currentUser?.uid !=null ?
            Visibility(
              visible:  provider.screenStatus == "menu" ?false : true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
        
                  loadingProvider.isLoading == false ?
                  ButtonWidget(text: provider.languageCode == "en" ? addCart_en :
                  provider.languageCode == "ku" ? addCart_ku :addCart_ar,
                    onClicked: (){
                      loadingProvider.setLoading(true);
        
                      Future<LoginModel?> model = Provider.of<SharedPreferenceProvider>(context,listen: false).getUserData(PrefKey.userLoginData);
                      model.then((value) {
                        print(value?.username);
                        print(value?.mobile);
                        print(value?.address);
                        print(value?.password);
                        addCart(value?.username,value?.mobile,value?.address,value?.password,
                            countProvider,productList[index].id.toString(),context);
                      }).onError((error, stackTrace) {
                        print(error.toString());
                        print(stackTrace.toString());
                      });
        
                    }, width: 200.0, height: 50.0,)
                      : ButtonLoadingWidget(width: 200.0, height: 50.0)
                ],
              ),
            ) :  Container(
                margin: EdgeInsets.all(20.0),
                child: ButtonWidget(text: "Login to Place Order", onClicked: (){
                  Get.to(()=> LoginScreen());
                }, width: Get.width, height: 50.0)),
                        ],
                      ),
            
        
            
        
          ],
        ),
      ),
    );
  }

  void addCart(username,mobile,address,password, CartItemsProvider provider,id,context) async{

    try{

      http.Response response = await http.post(
          Uri.parse(API_URL),
          body: {
            ApiKey.key_action : ApiAction.ADD_TO_CART,
            ApiKey.key_items_id : id,
            ApiKey.key_status : "pending",
            ApiKey.key_note : notesController.text.toString(),
            ApiKey.key_mobile : mobile,
            ApiKey.key_orderQty : provider.count.toString(),
          }
      );

      var body = jsonDecode(response.body.toString());
      print("Cart Body:${body}");

      print(response.statusCode);

      if(response.statusCode == 201){
        if(body["success"] == true){
          Get.snackbar("Item Added", body[ApiKey.key_message]);
          provider.setCount(1);
          Provider.of<ValueProvider>(context,listen: false).setLoading(false);

        }else{
          Get.snackbar("failed", body[ApiKey.key_message]);
          Provider.of<ValueProvider>(context,listen: false).setLoading(false);
        }
      }else{
        Provider.of<ValueProvider>(context,listen: false).setLoading(false);
      }


    }catch(e){
      print(e.toString());
    }
  }
}
