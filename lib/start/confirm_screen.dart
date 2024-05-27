import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:la_vapiano/cart/cart_screen.dart';
import 'package:la_vapiano/reservation/reservation_screen.dart';
import 'package:la_vapiano/utils/app_text.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/language_code_provider.dart';
import '../screen/item_menu_screen/items_menu_screen.dart';
import '../utils/constants.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: Get.width,
              height: Get.width,
              child: Image.asset(menu_image,fit: BoxFit.cover,),
            ),
          ),

          Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40.0,),
                    TextWidget(text: provider.languageCode == "en" ? "Welcome" : provider.languageCode == "ku" ? "بەخێربێیت" : "مرحباً",
                      size: 22.0,color: primaryColor,isBold: true,),
                    SizedBox(height: 10.0,),
                    Container(
                        margin: EdgeInsets.only(left: 20.0,right: 20.0),
                        child: TextWidget(text: provider.languageCode == "en" ? onbaord_text_en :
                        provider.languageCode == "ku" ? onboard_text_ku : onbaord_ar,
                          size: 14.0,color: Colors.white,textAlignment: TextAlign.center,)),
                    SizedBox(height: 30.0,),
                
                    Container(
                      margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: ButtonWidget(
                          text: provider.languageCode == "en" ? "Menu" : provider.languageCode == "ku" ? "مینۆ" : "مینو",
                          onClicked: (){
                            provider.setScreenStatus("menu");
                            Get.to(ItemsMenuScreen());
                          },
                          width: Get.width /1.2, height: 50.0,backgroundColor: primaryColor,),
                    ),
                
                    SizedBox(height: 20,),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: ButtonWidget(
                        text: provider.languageCode == "en" ? "Delivery" : provider.languageCode == "ku" ? "گەیاندن" : "توصيل",
                        isShadow: false,
                        onClicked: (){
                     //  Get.to(()=> CartScreen());
                          provider.setScreenStatus("delivery");
                          Get.to(ItemsMenuScreen());
                        },
                        width: Get.width /1.2, height: 50.0,backgroundColor: Colors.white,borderColor: primaryColor,textColor: primaryColor,),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: ButtonWidget(
                        text: provider.languageCode == "en" ? "Reservation" : provider.languageCode == "ku" ? "شوێن گرتن" : "حجز",
                        isShadow: false,
                        onClicked: (){
                        Get.to(()=> ReservationScreen());
                        },
                        width: Get.width /1.2, height: 50.0, backgroundColor: Colors.white, borderColor: primaryColor,textColor: primaryColor,),
                    ),
                    SizedBox(height: 20.0,),
                  ],
                ),
              ))



        ],
      ),
    );
  }
}
