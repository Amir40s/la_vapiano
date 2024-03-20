import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/item_menu_screen/items_menu_screen.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/menu_container.dart';
import 'package:la_vapiano/widget/text_widget.dart';

class SelectLanguageScreen extends StatelessWidget {
   SelectLanguageScreen({super.key});


 final List image = [flag_country,flag_america,flag_arbi];
 final List text = ['کوردی','English','عربی'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primaryColor,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background_main),
            fit: BoxFit.cover,
          )
        ),
        child: Stack(
          children: [
            Header(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(text: "Delivery From 11 AM - 11 PM", size: 22.0, isBold: true),
                  SizedBox(height: 20,),
                  TextWidget(text: "Choose a language", size: 20.0, isBold: true,fontFamily: oleoFont,),
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
                                  Get.to(ItemsMenuScreen());
                                },
                                child: MenuContainer(text: text[index], image: image[index],)),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
