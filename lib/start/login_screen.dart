import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:la_vapiano/API/Api.dart';
import 'package:la_vapiano/model/login_model.dart';
import 'package:la_vapiano/provider/language_code_provider.dart';
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
    final languageProvider = Provider.of<LanguageCodeProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5.0,),
                Header(isButton: true, text: languageProvider.languageCode == "en" ? "Login":
                languageProvider.languageCode == "ku" ? "چوونە ژورەوە" : "تسجيل الدخول",),

                SizedBox(height: 30.0,),
                // TextWidget(text: login_head_text, size: 18.0,color: primaryColor,),
                const SizedBox(height: 5.0,),
                TextWidget(text: languageProvider.languageCode == "en" ? "Login":
                languageProvider.languageCode == "ku" ? "چوونە ژورەوە" : "تسجيل الدخول", size: 14.0,color: Colors.white,),
                SizedBox(height: 20.0,),
                CustomTextField(hintText: languageProvider.languageCode == "en" ? "Phone"
                    : languageProvider.languageCode == "ku" ?"ژ. مۆبایل" : "رقم مۆبایل", controller: phoneController),
                SizedBox(height: 20.0,),
                CustomTextField(hintText: languageProvider.languageCode == "en" ? "Password"
                    : languageProvider.languageCode == "ku" ? "ووشەی نهێنی" : "كلمة المرور", controller: passwordController),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomRichText(press: (){
                     Get.to(ResetPasswordScreen());
                    },
                      firstText: "",
                      secondText: languageProvider.languageCode == "en" ? "Forgot Password?" :
                      languageProvider.languageCode =="ku" ? "هەژمارت هەیە" : "نسيت كلمة السر?"
                    ),
                ],
                ),

                SizedBox(height: 40.0,),
                Consumer<ValueProvider>(
                builder: (context,provider,index){
                  return provider.isLoading == false ? ButtonWidget(
                      text: languageProvider.languageCode == "en" ? "Login":
                      languageProvider.languageCode == "ku" ? "چوونە ژورەوە" : "تسجيل الدخول",
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
                  firstText: languageProvider.languageCode == "en" ? "Don't have an account?" :
                  languageProvider.languageCode == "ku" ? "هەژمارت نیە؟" : "ليس لديك حساب؟",
                  secondText: languageProvider.languageCode == "en" ? "Sign Up" :
                  languageProvider.languageCode == "ku" ? "خۆتۆمار کردن" : "تسجيل",
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
           signInAuth(context);

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

  void signInAuth(context) {
    Future<LoginModel?> model = Provider.of<SharedPreferenceProvider>(context,listen: false).getUserData(PrefKey.userLoginData);
    model.then((value) async{
      print(value?.mobile);
      print(value?.email);

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: value!.email.toString(),
            password: value.password.toString()
        ).whenComplete(() {
          Get.to(()=> const ConfirmScreen());
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }

    }).onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
    });
  }
}
