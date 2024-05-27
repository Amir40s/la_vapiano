// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/controller/OrderHistoryController.dart';
import 'package:la_vapiano/screen/food_history/provider/history_provider.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/app_text.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../../API/Api.dart';
import '../../provider/language_code_provider.dart';
class FoodHistoryScreen extends StatelessWidget {
   FoodHistoryScreen({super.key});


  FirebaseAuth  mAuth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    var orderHistoryModel = Get.put(OrderHistoryController(context));
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          provider.languageCode == "en" ? order_history_en :
          provider.languageCode == "ku" ? order_history_ku : order_history_ar
          ,style: TextStyle(color: Colors.white),),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:
            // mAuth.currentUser?.uid !=null ? MainAxisAlignment.start :
            MainAxisAlignment.center,
            crossAxisAlignment:
            // mAuth.currentUser?.uid !=null ? CrossAxisAlignment.start :
            CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  FirebaseAuth.instance.currentUser?.uid !=null ?
                  Obx(() {
                    if(orderHistoryModel.isLoading.value){
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.red,),
                      );
                    }
                    if(orderHistoryModel.historyModel!.orders!.isNotEmpty){
                      return DynamicHeightGridView(
                        itemCount: orderHistoryModel.historyModel!.orders!.length,
                        shrinkWrap: true,
                        crossAxisCount: 1,
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                        physics:  BouncingScrollPhysics(),
                        builder: (context,index){
                          // return Text("Text");
                          return _itemsBuild(context,index,provider,orderHistoryModel);
                        },
                      );
                    }else{
                      return Center(
                        child: Text("No History"),
                      );
                    }

                  }) : Container(
                    margin: EdgeInsets.all(20.0),
                    child: ButtonWidget(text: "Login to See cart", onClicked: (){
                      Get.to(LoginScreen());
                    }, width: Get.width, height: 50.0),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

   Widget _itemsBuild(BuildContext context,int index,LanguageCodeProvider provider,OrderHistoryController  orderHistoryModel){
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
         title: Text(
           orderHistoryModel.historyModel!.orders![index].en.toString()
         ),
         subtitle: Text(
           maxLines: 1,
            orderHistoryModel.historyModel!.orders![index].dateTime.toString()
         ),
         trailing: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             TextWidget(text: "QTY: ${ orderHistoryModel.historyModel!.orders![index].orderQty.toString()}", size: 12.0,color: Colors.black,),
             SizedBox(height: 10.0,),
             TextWidget(text: "Price: ${ orderHistoryModel.historyModel!.orders![index].price.toString()}", size: 12.0,color: Colors.red,isBold: true,),
           ],
         ),
       ),
     );
   }
}
