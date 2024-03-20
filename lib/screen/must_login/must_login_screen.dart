import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),

            SizedBox(height: 30.0,),
            TextWidget(text: must_login_text, size: 22.0,fontFamily: oleoFont,color: Colors.white,),

            SizedBox(height: 60.0,),
            Container(
              width: Get.width,
              height: 300.0,
              padding: EdgeInsets.all(50.0),
              child: Image.asset(cartoon_image),
            ),
            SizedBox(height: 30.0,),
            TextWidget(text: "You must login to see the history", size: 16.0,fontFamily: oleoFont,color: Colors.white,),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(20.0),
                child: ButtonWidget(text: "Login", onClicked: (){}, width: 100.0, height: 40.0,radius: 50.0,)),
          ],
        ),
      ),
    );
  }
}
