import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/food_history/provider/history_provider.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';
class FoodHistoryScreen extends StatelessWidget {
   FoodHistoryScreen({super.key});


  FirebaseAuth  mAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Column(
              mainAxisAlignment: mAuth.currentUser?.uid !=null ? MainAxisAlignment.start : MainAxisAlignment.center,
              crossAxisAlignment: mAuth.currentUser?.uid !=null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                mAuth.currentUser?.uid !=null ? Text("Empty History") : Center(
                  child: Column(
                    children: [
                      TextWidget(text: "Login to see history", size: 16.0,color: Colors.black,),
                      SizedBox(height: 20.0,),
                      ButtonWidget(text: "Login",onClicked: (){
                        Get.offAll(LoginScreen());
                      }, width: Get.width/2, height: 50.0,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget _itemsBuilder(BuildContext context,int index){
    return Text("Data");
}

}
