import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:la_vapiano/screen/ask_language/select_language_screen.dart';
import 'package:la_vapiano/screen/home/home_screen.dart';
import 'package:la_vapiano/start/confirm_screen.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/constants.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4),(){
      //Get.offAll(const ConfirmScreen());
      Get.offAll( LoginScreen());
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(80.0),
                child: Image.asset(ic_logo)
            ),

          ],
        ),
      ),
    );
  }
}
