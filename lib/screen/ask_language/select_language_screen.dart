import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/provider/language_code_provider.dart';
import 'package:la_vapiano/screen/home/home_screen.dart';
import 'package:la_vapiano/screen/item_menu_screen/items_menu_screen.dart';

import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/menu_container.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

class SelectLanguageScreen extends StatelessWidget {
   SelectLanguageScreen({super.key});


 final List image = [flag_country,flag_america,flag_arbi];
 final List text = ['کوردی','English','عربی'];

 var lanCode = "en";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        children: [
         Expanded(
             flex: 2,
             child: Column(
           children: [
             Header(text: 'Delivery',),
             SizedBox(height: 20,),
             Image.asset(bike_image,width: Get.width,height: Get.width / 2.5,),
             SizedBox(height: 10,),
             TextWidget(text: "Delivery From 11 AM - 11 PM", size: 22.0,color: primaryColor,),
           ],
         )),

          Expanded(
          flex: 2,
            child: Container(
              height: Get.height/2,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0,),
                  TextWidget(text: "Choose a language", size: 20.0, isBold: true),
                  Center(
                    child: ListView.builder(
                        itemCount: text.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                            margin: EdgeInsets.only(left: 50.0,right: 50.0,top: 10.0,bottom: 10.0),
                            child: GestureDetector(
                                onTap: (){
                                  print(text[index]);
                                  if(text[index] == "کوردی"){
                                   provider.setLanguageCode("ku");
                                    // provider.setStringValue(PrefKey.key_languageCode, "ku");
                                  }else if(text[index] == "English"){
                                    provider.setLanguageCode("en");
                                    // provider.setStringValue(PrefKey.key_languageCode, "en");
                                  }else if(text[index] == "عربی"){
                                    provider.setLanguageCode("ar");
                                    // provider.setStringValue(PrefKey.key_languageCode, "ar");
                                  }
                                  // print(provider.getStringValue(PrefKey.key_languageCode));
                                Get.to(ItemsMenuScreen());
                                },
                                child: MenuContainer(text: text[index], image: image[index],)),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
