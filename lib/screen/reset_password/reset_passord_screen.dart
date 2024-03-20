import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/text_widget.dart';

import '../../widget/button_widget.dart';
import '../../widget/custom_textfield.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});

  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  width: 25.0,
                  height: 25.0,
                  child: Image.asset(ic_back),
                ),
              ),

                SizedBox(height: 20,),
                Container(
                  width: Get.width,
                  height: 150.0,
                  child: Image.asset(lock_image),
                ),

                SizedBox(height: 20,),
                Container(
                    child: Center(child: TextWidget(text: "Reset your password ", size: 18.0,color: secondaryColor,))),
              SizedBox(height: 10.0,),
                Container(
                    child: Center(child: TextWidget(text: "We have sent a four digit code on your phone / email", size: 12.0,))),


                SizedBox(height: 40.0,),
               TextWidget(text: "New Password", size: 12.0),
                SizedBox(height: 10.0,),
                CustomTextField(hintText: "New Password", controller: controller),

                SizedBox(height: 10.0,),
               TextWidget(text: "Confirm Password", size: 12.0),
                SizedBox(height: 10.0,),
                CustomTextField(hintText: "Confirm Password", controller: controller),

                SizedBox(height: 40.0,),
                ButtonWidget(
                    text: "Reset Password",
                    onClicked: (){},
                    width: Get.width, height: 60.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
