import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:la_vapiano/API/Api.dart';
import 'package:la_vapiano/model/login_model.dart';
import 'package:la_vapiano/shared_preference/shared_preference_provider.dart';
import 'package:la_vapiano/utils/app_text.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_loading_widget.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/custom_richtext.dart';
import 'package:la_vapiano/widget/custom_textfield.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/value_provider.dart';
import '../screen/create_account/create_account_screen.dart';
import '../screen/reset_password/reset_passord_screen.dart';
import 'confirm_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final shareprefProvider = Provider.of<SharedPreferenceProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5.0,),
                Header(isButton: true, text: 'Sign In',),

                SizedBox(height: 30.0,),
                TextWidget(text: login_head_text, size: 18.0,color: primaryColor,),
                const SizedBox(height: 5.0,),
                TextWidget(text: "Login to your account", size: 14.0,color: Colors.black,),
                SizedBox(height: 20.0,),
                CustomTextField(hintText: "Phone", controller: phoneController),
                SizedBox(height: 20.0,),
                CustomTextField(hintText: "Password", controller: passwordController),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomRichText(press: (){
                     Get.to(ResetPasswordScreen());
                    },
                      firstText: "",
                      secondText: "Forgot Password?",
                    ),
                ],
                ),

                SizedBox(height: 40.0,),
                Consumer<ValueProvider>(
                builder: (context,provider,index){
                  return provider.isLoading == false ? ButtonWidget(
                      text: "Login",
                      onClicked: (){
                        provider.setLoading(true);
                        login(phoneController.text.toString(),
                            passwordController.text.toString(),context,shareprefProvider);




                      },
                      width: MediaQuery.sizeOf(context).width, height: 60.0) :
                  ButtonLoadingWidget(width: MediaQuery.sizeOf(context).width, height: 60.0);
                },
                ),
                SizedBox(height: 20.0,),

                SizedBox(height: 10.0,),
                CustomRichText(press: (){
                  Get.to(CreateAccountScreen());
                },
                  firstText: "Don't have an account?",
                  secondText: "Sign Up",
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(String phone, String password,BuildContext context,SharedPreferenceProvider provider) async{
    try{

       http.Response response = await http.post(
        Uri.parse(API_URL),
        body: {
          ApiKey.key_action : ApiAction.LOGIN,
          ApiKey.key_mobile : phone,
          ApiKey.key_password : password,
        }
      );

       var body = jsonDecode(response.body.toString());
       print("Login body:${body}");
       if(response.statusCode ==200){

         if(body["success"] == true){
           Get.snackbar("Login success", "Login successfully", duration: Duration(seconds: 2),);
           Provider.of<ValueProvider>(context,listen: false).setLoading(false);
           LoginModel model = LoginModel(
               username: body[ApiKey.key_username],
               mobile: body[ApiKey.key_mobile],
               address: body[ApiKey.key_address],
           );
           provider.setUserData(PrefKey.userLoginData, model).whenComplete(() {
             Get.to(ConfirmScreen());
           });

         }else{
           Get.snackbar("Login Failed", body[ApiKey.key_message], duration: Duration(seconds: 2),);
           Provider.of<ValueProvider>(context,listen: false).setLoading(false);
         }

       }else{

         Get.snackbar("Login failed", body[ApiKey.key_message], duration: Duration(seconds: 2),);
         Provider.of<ValueProvider>(context,listen: false).setLoading(false);
       }

    }catch(e){
      print(e.toString());
    }
  }
}
