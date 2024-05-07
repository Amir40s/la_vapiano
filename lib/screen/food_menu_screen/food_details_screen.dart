import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../../API/Api.dart';
import '../../provider/language_code_provider.dart';
import 'package:http/http.dart' as http;

class FoodDetailsScreen extends StatelessWidget {
 final List productList;
 final int index;
  const FoodDetailsScreen({super.key, required this.productList, required this.index, });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Details",style: TextStyle(color: Colors.white),),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Image.network("$API_IMAGE_URL${productList[index].image}",height: 400.0,width: Get.width,fit: BoxFit.cover,),
          
          
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

                   , size: 22.0,color: Colors.black,isBold: true,),

                 TextWidget(text: "IQD ${productList[index].price.toString()}", size: 22.0,color: Colors.black,isBold: true,),
               ],
              ),
              SizedBox(height: 10.0,),
              Container(
                  width: Get.width,
                  child: TextWidget(text: provider.languageCode == "en" ?  productList[index].descen :
                      provider.languageCode == "ku" ?  productList[index].descku  : productList[index].descar
                    , size: 16.0,color: Colors.black,)),
            ],
          ),
          ),
          
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ButtonWidget(text: "Place Order", onClicked: (){}, width: 200.0, height: 50.0),
                SizedBox(width: 10.0,),
                ButtonWidget(text: "Add to Cart", onClicked: (){

                  // addCart();

                }, width: 200.0, height: 50.0,)
            ],
          )
          
          
        ],
      ),
    );
  }

  // void addCart() async{
  //   try{
  //
  //     http.Response response = await http.post(
  //         Uri.parse(API_URL),
  //         body: {
  //           ApiKey.key_action : ApiAction.ADD_TO_CART,
  //           ApiKey.key : phone,
  //           ApiKey.key_password : password,
  //         }
  //     );
  //
  //     var body = jsonDecode(response.body.toString());
  //
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }

 // void placeOrder() async{
 //   try{
 //
 //     http.Response response = await http.post(
 //         Uri.parse(API_URL),
 //         body: {
 //           ApiKey.key_action : ApiAction.ADD_TO_CART,
 //           ApiKey.key : phone,
 //           ApiKey.key_password : password,
 //         }
 //     );
 //
 //     var body = jsonDecode(response.body.toString());
 //
 //   }catch(e){
 //     print(e.toString());
 //   }
 // }



}
