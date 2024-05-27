import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/API/Api.dart';
import 'package:la_vapiano/provider/language_code_provider.dart';
import 'package:la_vapiano/provider/value_provider.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_loading_widget.dart';
import 'package:la_vapiano/widget/custom_richtext.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../../model/login_model.dart';
import '../../shared_preference/shared_preference_provider.dart';
import '../../widget/button_widget.dart';
import '../../widget/custom_textfield.dart';
import 'package:http/http.dart' as http;

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final _key = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final shareprefProvider = Provider.of<SharedPreferenceProvider>(context,listen: false);
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Header(text: "Sign Up"),


                SizedBox(height: 40,),
                TextWidget(text: provider.languageCode == "en" ? "Register"
                  : provider.languageCode == "ku" ?  "" : "", size: 22.0,color: primaryColor,),
                SizedBox(height: 10.0,),
              //  TextWidget(text: "Create your new account", size: 14.0,color: Colors.white,),

                SizedBox(height: 20.0,),
                CustomTextField(hintText: "Username", controller: usernameController),

                SizedBox(height: 10.0,),
                CustomTextField(hintText: "Phone", controller: mobileController),

                SizedBox(height: 10.0,),
                CustomTextField(hintText: "Address", controller: addressController),

                SizedBox(height: 10.0,),
                CustomTextField(hintText: "Email", controller: emailController),

                SizedBox(height: 10.0,),
                CustomTextField(hintText: "Password", controller: passwordController),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: "I agree to your",
                          style: const TextStyle(color: Colors.white),
                          children: <InlineSpan>[
                            const WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 5.0)),
                            TextSpan(
                              text: "Privacy Policy",
                              style: const TextStyle(color: primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){},
                            ),
                            const WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 5.0)),
                            TextSpan(
                              text: " and",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 5.0)),
                            TextSpan(
                              text: " \nTerms & Conditions",
                              style: const TextStyle(color: primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){},
                            ),
                            const WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 5.0)),
                          ],
                        )
                    )
                  ],
                ),

                SizedBox(height: 40.0,),
                Consumer<ValueProvider>(
                 builder: (context,provider,index){
                   return provider.isLoading == false ? ButtonWidget(
                       text: "Sign Up",
                       onClicked: (){
                         if (_key.currentState!.validate()) {
                           provider.setLoading(true);
                           signUp(
                             username: usernameController.text.toString(),
                             mobile: mobileController.text.toString(),
                             address: addressController.text.toString(),
                             email: emailController.text.toString(),
                             password: passwordController.text.toString(),
                             context: context,
                             shareprefProvider: shareprefProvider,
                           );
                         }
                       },
                       width: Get.width, height: 60.0) :
                   ButtonLoadingWidget(width: Get.width, height: 60.0);
                 },
                ),

                SizedBox(height: 20.0,),
                CustomRichText(press: (){
                  Get.offAll(LoginScreen());
                },
                  firstText: "Already an account?",
                  secondText: "Login",
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp({required username,required mobile,required address, required email,
    required password,required context,required shareprefProvider}) async{

    try{
      http.Response response = await http.post(
        Uri.parse(API_URL),
        body: {
          ApiKey.key_action : ApiAction.REGISTER,
          ApiKey.key_username : username,
          ApiKey.key_mobile : mobile,
          ApiKey.key_address : address,
          ApiKey.key_email : email,
          ApiKey.key_password : password,
        }
      );

      print(response.statusCode);
      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){

        print(data);
        if(data["success"] == true){
          LoginModel model = LoginModel(
            username: username,
            mobile: mobile,
            address: address,
            password: password,
            email: email,
          );
          shareprefProvider.setUserData(PrefKey.userLoginData, model).whenComplete(() {
            createAuth(context,data[ApiKey.key_message]);
          });

        }else{
          Provider.of<ValueProvider>(context,listen: false).setLoading(false);

        }

      }else{
        Provider.of<ValueProvider>(context,listen: false).setLoading(false);
        Get.snackbar("Registration failed", data[ApiKey.key_message]);
      }

    }catch(e){
      print(e.toString());
    }

  }

  void createAuth(context,message) async{

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      ).whenComplete(() {
        Provider.of<ValueProvider>(context,listen: false).setLoading(false);
        Get.snackbar("Registration Successfully", message);
        Get.offAll(LoginScreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
