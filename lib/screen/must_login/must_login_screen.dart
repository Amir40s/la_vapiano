import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/shipping/shipping_screen.dart';
import 'package:la_vapiano/utils/app_text.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/text_widget.dart';

import '../../widget/button_widget.dart';

class MustLoginScreen extends StatelessWidget {
  const MustLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
              flex: 3,
              child: Column(children: [
            Header(text: 'Login',),

            SizedBox(height: 30.0,),
            TextWidget(text: must_login_text, size: 22.0,color: Colors.black,),

            Container(
              width: Get.width,
              height: 200.0,
              padding: EdgeInsets.all(10.0),
              child: Image.asset(login_image),
            ),
            SizedBox(height: 30.0,),
            Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextWidget(text: "You must login to see the history", size: 16.0,color: Colors.white,isBold: true,)),

          ],)),

         Expanded(
           flex: 2,
           child: Container(
             width: Get.width,
             padding: EdgeInsets.all(20.0),
             color: primaryColor,
             child: Column(
               children: [
                 Container(
                   width: Get.width,
                   padding: EdgeInsets.all(20.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),
                     color: Colors.white,
                   ),
                   margin: EdgeInsets.all(10.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       ButtonWidget(text: "Login", onClicked: (){
                         Get.to(ShippingScreen());
                       }, width: Get.width/2, height: 50.0,radius: 15.0,),
                       Image.asset(data_table_image,width: Get.width,height: 200.0)
                     ],
                   ),
                 )
               ],
             )
         ),)
        ],
      ),
    );
  }
}
