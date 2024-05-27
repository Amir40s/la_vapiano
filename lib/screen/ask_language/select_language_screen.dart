import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/provider/language_code_provider.dart';
import 'package:la_vapiano/screen/home/home_screen.dart';
import 'package:la_vapiano/screen/item_menu_screen/items_menu_screen.dart';
import 'package:la_vapiano/start/confirm_screen.dart';
import 'package:la_vapiano/utils/app_text.dart';

import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/menu_container.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/language/applocalization.dart';
import '../../utils/language/provider/language_provider.dart';
import '../../widget/custom_richtext.dart';

class SelectLanguageScreen extends StatelessWidget {
   SelectLanguageScreen({super.key});


 final List image = [flag_country,flag_america,flag_arbi];
 final List text = ['کوردی','English','عربی'];

 var lanCode = "en";

  @override
  Widget build(BuildContext context) {
    var translator = AppLocalizations.of(context);
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    var language  = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor:Colors.black,
      body: Column(
        children: [

         Expanded(
             flex: 1,
             child: Column(
           children: [
             SizedBox(height: 30,),
             Container(
                 padding: EdgeInsets.all(60.0),
                 child: Image.asset(ic_logo,width: Get.width,height: Get.width / 2.5,color: primaryColor,)),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.phone,color: Colors.white,),
                 SizedBox(width: 5.0,),
                 TextWidget(text: "+964(0)770 626 3030", size: 16.0,color: Colors.white,)
               ],
             ),
             SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.location_on,color: Colors.white,),
                 SizedBox(width: 5.0,),
                 TextWidget(text: "Sulaymaniyah, Garden City", size: 16.0,color: Colors.white,)
               ],
             ),

             SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.facebook,color: Colors.white,),
                 SizedBox(width: 5.0,),
                 TextWidget(text: "La Vapiano Cafe & Rest", size: 16.0,color: Colors.white,)
               ],
             ),

             SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset(ic_instagram,width: 24.0,height: 24.0,color: Colors.white,),
                 SizedBox(width: 5.0,),
                 TextWidget(text: "la.vapiano", size: 16.0,color: Colors.white,)
               ],
             ),

             Container(
               height: Get.height/2,
               decoration: BoxDecoration(
                   color: Colors.black,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0))
               ),
               child: SingleChildScrollView(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(height: 40.0,),
                     const AutoSizeText(
                       "Choose a language - زمانێک هەڵبژێرە - اختر لغة",
                       minFontSize: 11.0,
                       maxFontSize: 16.0,
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                       ),
                     ),
                     // TextWidget(text: "Choose a language - زمانێک هەڵبژێرە - اختر لغة ", size: 16.0, isBold: true,color: Colors.white,),
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
                                       language.setLocale(Locale("fa","IR"));
                                       print(translator.translate("Delivery From 11 Am - 11 PM"));
                                       // provider.setStringValue(PrefKey.key_languageCode, "ku");
                                     }else if(text[index] == "English"){
                                       provider.setLanguageCode("en");
                                       language.setLocale(Locale("en","US"));
                                       print(translator.translate("Delivery From 11 Am - 11 PM"));
                                       // provider.setStringValue(PrefKey.key_languageCode, "en");
                                     }else if(text[index] == "عربی"){
                                       provider.setLanguageCode("ar");
                                       language.setLocale(Locale('ar','SA'));
                                       print(translator.translate("Delivery From 11 Am - 11 PM"));
                                       // provider.setStringValue(PrefKey.key_languageCode, "ar");
                                     }
                                     // print(provider.getStringValue(PrefKey.key_languageCode));
                                     // Get.to(ItemsMenuScreen());
                                     Get.to(ConfirmScreen());
                                   },
                                   child: MenuContainer(text: text[index], image: image[index],)),
                             );
                           }),
                     ),
                   ],
                 ),
               ),
             ),

             // Consumer<LanguageCodeProvider>(
             //   builder: (context, provider,child){
             //     return TextWidget(text: provider.languageCode == "en" ? deliveryTimeText_en :
             //       provider.languageCode == "ku" ? deliveryTimeText_ku : deliveryTimeText_ar
             //       , size: 22.0,color: primaryColor,isBold: true,);
             //   },
             // ),
           ],
         )),

          // Expanded(
          //   child: Container(
          //     height: Get.height/2,
          //     decoration: BoxDecoration(
          //       color: Colors.black,
          //       borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0))
          //     ),
          //     child: SingleChildScrollView(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           SizedBox(height: 40.0,),
          //          const AutoSizeText(
          //             "Choose a language - زمانێک هەڵبژێرە - اختر لغة",
          //             minFontSize: 11.0,
          //             maxFontSize: 16.0,
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //                 color: Colors.white
          //             ),
          //           ),
          //          // TextWidget(text: "Choose a language - زمانێک هەڵبژێرە - اختر لغة ", size: 16.0, isBold: true,color: Colors.white,),
          //           Center(
          //             child: ListView.builder(
          //                 itemCount: text.length,
          //                 shrinkWrap: true,
          //                 physics: const BouncingScrollPhysics(),
          //                 itemBuilder: (context,index){
          //                   return Container(
          //                     margin: EdgeInsets.only(left: 50.0,right: 50.0,top: 10.0,bottom: 10.0),
          //                     child: GestureDetector(
          //                         onTap: (){
          //                           print(text[index]);
          //                           if(text[index] == "کوردی"){
          //                            provider.setLanguageCode("ku");
          //                            language.setLocale(Locale("fa","IR"));
          //                            print(translator.translate("Delivery From 11 Am - 11 PM"));
          //                             // provider.setStringValue(PrefKey.key_languageCode, "ku");
          //                           }else if(text[index] == "English"){
          //                             provider.setLanguageCode("en");
          //                             language.setLocale(Locale("en","US"));
          //                             print(translator.translate("Delivery From 11 Am - 11 PM"));
          //                             // provider.setStringValue(PrefKey.key_languageCode, "en");
          //                           }else if(text[index] == "عربی"){
          //                             provider.setLanguageCode("ar");
          //                             language.setLocale(Locale('ar','SA'));
          //                             print(translator.translate("Delivery From 11 Am - 11 PM"));
          //                             // provider.setStringValue(PrefKey.key_languageCode, "ar");
          //                           }
          //                           // print(provider.getStringValue(PrefKey.key_languageCode));
          //                      // Get.to(ItemsMenuScreen());
          //                       Get.to(ConfirmScreen());
          //                         },
          //                         child: MenuContainer(text: text[index], image: image[index],)),
          //                   );
          //                 }),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
