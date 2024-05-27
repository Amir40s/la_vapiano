
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/provider/language_code_provider.dart';
import 'package:la_vapiano/screen/home/home_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';



class Header extends StatelessWidget {
  bool isButton;
  final String text;
   Header({
    Key? key, this.isButton = false, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    return Stack(
      children: [
        SafeArea(
            child: Row(
              mainAxisAlignment: isButton ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
             children: [
               GestureDetector(
                 onTap: (){
                   Get.back();
                 },
                 child: Container(
                     height: defaultHeaderHeight / 2.5,
                     margin:  EdgeInsets.only(left: isButton ? 0.0 : 10.0,top: 10.0),
                     child: Image.asset(ic_back_fancy,fit: BoxFit.cover,)
                 ),
               ),


              if(isButton == false)
              SizedBox(width: Get.width * .2,),
              TextWidget(text: text, size: 16.0,color: Colors.white,),

              isButton ?   Container(
                child: ButtonWidget(
                    text: provider.languageCode == "en" ? "Menu" : provider.languageCode =="ku" ? "میبۆ" : "قائمة طعام", onClicked: (){
                      Get.to(HomeScreen(menuName: '',));
                }, width: 100.0, height: 40.0),
              ) : SizedBox()
             ],
            )
        )



      ],
    );
  }
}

