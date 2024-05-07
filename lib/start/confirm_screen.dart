import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:la_vapiano/screen/ask_language/select_language_screen.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/app_text.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';

import '../utils/constants.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            height: Get.width,
            child: Image.asset(onboard_image,fit: BoxFit.cover,),
          ),

          Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(height: 40.0,),
                  TextWidget(text: "Welcome", size: 22.0,color: primaryColor,isBold: true,),
                  SizedBox(height: 10.0,),
                  Container(
                      margin: EdgeInsets.only(left: 20.0,right: 20.0),
                      child: TextWidget(text: onbaord_text, size: 14.0,color: Colors.black,textAlignment: TextAlign.center,)),
                  SizedBox(height: 30.0,),

                  Container(
                    margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: ButtonWidget(
                        text: "Menu",
                        onClicked: (){
                          Get.to(SelectLanguageScreen());
                        },
                        width: Get.width /1.2, height: 50.0,backgroundColor: primaryColor,),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: ButtonWidget(
                      text: "Delivery",
                      isShadow: false,
                      onClicked: (){
                        // Get.to(LoginScreen());
                      },
                      width: Get.width /1.2, height: 50.0,backgroundColor: Colors.white,borderColor: primaryColor,textColor: primaryColor,),
                  ),
                ],
              ))



        ],
      ),
    );
  }
}
