import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/API/Api.dart';
import 'package:la_vapiano/provider/value_provider.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:provider/provider.dart';

import '../../widget/button_loading_widget.dart';
import '../../widget/button_widget.dart';
import '../../widget/custom_textfield.dart';
import 'package:http/http.dart' as http;

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});

  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(text: "Forgot Password"),
              SizedBox(height: 20,),
              Container(
                width: Get.width,
                height: 150.0,
                child: Image.asset(lock_image),
              ),


              SizedBox(height: 10.0,),
              CustomTextField(hintText: "Enter Email Address", controller: controller),

              SizedBox(height: 40.0,),
              Consumer<ValueProvider>(
              builder: (context,provider,index){
                return  provider.isLoading == false ? ButtonWidget(
                    text: "Send Request",
                    onClicked: (){
                      provider.setLoading(true);
                      sendForgotRequest(context);
                    },
                    width: Get.width, height: 60.0) :
                ButtonLoadingWidget(width: MediaQuery.sizeOf(context).width, height: 60.0);;
              },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void sendForgotRequest(context) async{
    http.Response response = await http.post(Uri.parse(API_URL),
        body: {
      "action" : ApiAction.FORGOT_PASSWORD,
      "resetme" : "1",
      "email" : controller.text.toString()
    });

    print(response.statusCode);
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      Provider.of<ValueProvider>(context,listen: false).setLoading(false);
      Get.snackbar("Request Send Successfully", data["message"]);
    }else{
      Provider.of<ValueProvider>(context,listen: false).setLoading(false);
      Get.snackbar("Request Failed", data["message"]);
    }

  }
}
