
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/app_text.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/text_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              padding: EdgeInsets.all(20.0),
              child: TextWidget(text: about_head_text,size: 22.0,color: Colors.white,fontFamily: oleoFont,),
            ),

            Container(
              margin: EdgeInsets.only(top: 30.0),
              padding: EdgeInsets.only(left: 20.0,right: Get.width / 5),
              child: TextWidget(text: about_para1_text,size: 12.0,color: Colors.white),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0,right: Get.width / 5),
              child: TextWidget(text: about_para2_text,size: 12.0,color: Colors.white),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0,right: Get.width / 5),
              child: TextWidget(text: about_para3_text,size: 12.0,color: Colors.white),
            ),
            
            Container(
                margin: EdgeInsets.only(top: 30.0),
                padding: EdgeInsets.all(20.0),
                child: ButtonWidget(text: "login", onClicked: (){
                  Get.to(LoginScreen());
                }, width: 100.0, height: 40.0,radius: 50.0,)),

            Container(
              width: Get.width,
              height: 500.0,
              margin: const EdgeInsets.only(bottom: 100.0),
              child: Image.asset(big_burger_image),
            )
          ],
        ),
      ),
    );
  }
}
