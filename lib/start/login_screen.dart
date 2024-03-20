import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/create_account/create_account_screen.dart';
import 'package:la_vapiano/screen/reset_password/reset_passord_screen.dart';
import 'package:la_vapiano/utils/app_text.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/custom_richtext.dart';
import 'package:la_vapiano/widget/custom_textfield.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/text_widget.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.0,),
                Header(isButton: true,),

                SizedBox(height: 30.0,),
                TextWidget(text: login_head_text, size: 18.0,color: secondaryColor,
                fontFamily: oleoFont,),
                const SizedBox(height: 5.0,),
                TextWidget(text: "Login", size: 14.0,isBold: true,),
                SizedBox(height: 20.0,),
                CustomTextField(hintText: "Mobile Number", controller: controller),
                SizedBox(height: 20.0,),
                CustomTextField(hintText: "Password", controller: controller),
                SizedBox(height: 40.0,),
                ButtonWidget(
                    text: "Login",
                    onClicked: (){},
                    width: Get.width, height: 60.0),
                SizedBox(height: 20.0,),
                CustomRichText(press: (){
                  Get.to(ResetPasswordScreen());
                },
                  firstText: "Forgot Password?",
                  secondText: "Reset Password",
                ),
                SizedBox(height: 10.0,),
                CustomRichText(press: (){
                  Get.to(CreateAccountScreen());
                },
                  firstText: "Don't have an account?",
                  secondText: "Sign Up",
                ),

                SizedBox(height: 30.0,),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                     color: secondaryColor,
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Center(
                      child: Image.asset(ic_upper_arrow),
                    ),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
