import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/custom_richtext.dart';
import 'package:la_vapiano/widget/text_widget.dart';

import '../../widget/button_widget.dart';
import '../../widget/custom_textfield.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

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


                SizedBox(height: 40,),
                TextWidget(text: "Create an account", size: 22.0,color: secondaryColor,isBold: true,),

                SizedBox(height: 10.0,),
                CustomTextField(hintText: "Your Name", controller: controller),

                SizedBox(height: 10.0,),
                CustomTextField(hintText: "+11", controller: controller),

                SizedBox(height: 10.0,),
                CustomTextField(hintText: "Email", controller: controller),

                SizedBox(height: 10.0,),
                CustomTextField(hintText: "Password", controller: controller),


                SizedBox(height: 40.0,),
                ButtonWidget(
                    text: "Sign In",
                    onClicked: (){},
                    width: Get.width, height: 60.0),

                SizedBox(height: 20.0,),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
              text: "By sign, I accept the",
              style: const TextStyle(color: whiteColor),
              children: <InlineSpan>[
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 5.0)),
                TextSpan(
                  text: "Terms of service",
                  style: const TextStyle(color: secondaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (){},
                ),
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 5.0)),
                TextSpan(
                  text: "and",
                  style: const TextStyle(color: whiteColor),
                ),
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 5.0)),
                TextSpan(
                  text: "Community Guidelines",
                  style: const TextStyle(color: secondaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (){},
                ),
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 5.0)),
                TextSpan(
                  text: "and have read",
                  style: const TextStyle(color: whiteColor),
                ),
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 5.0)),
                TextSpan(
                  text: "Privacy Policy",
                  style: const TextStyle(color: secondaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (){},
                ),
              ],
            )
              )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
