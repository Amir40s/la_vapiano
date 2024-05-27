
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
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Expanded(
              flex: 4,
              child: Column(children: [
            Header(text: 'About Us',),
            Container(
                margin: EdgeInsets.all(20.0),
                child: Image.asset(onboard_image,width: Get.width,height: Get.width / 2,fit: BoxFit.cover,)),
          ],)),

          Expanded(
              flex: 4,
              child: Container(
            height: Get.height/2,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(text: "About Us", size: 22.0,color: Colors.white,isBold: true,),

                Container(
                  height: Get.height / 2.9,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          margin: EdgeInsets.only(left: 20.0),
                            child: ButtonWidget(text: "Read More", onClicked: (){
                              Get.to(LoginScreen());
                            }, width: 150.0, height: 40.0,radius: 10.0,)),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          )),



        ],
      ),
    );
  }
}
