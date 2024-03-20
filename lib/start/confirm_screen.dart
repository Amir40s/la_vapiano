import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/widget/button_widget.dart';

import '../utils/constants.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                  height: 200,
                  padding: EdgeInsets.all(80.0),
                  child: Center(child: Image.asset(ic_logo))
              ),
            ),

            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: ButtonWidget(
                          text: "Menu",
                          onClicked: (){
                            Get.to(LoginScreen());
                          },
                          width: Get.width, height: 50.0),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: ButtonWidget(
                          text: "Delivery",
                          onClicked: (){},
                          width: Get.width, height: 50.0),
                    ),
                  ],
                ))



          ],
        ),
      ),
    );
  }
}
