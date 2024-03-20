
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/home/home_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';



class Header extends StatelessWidget {
  bool isButton;
   Header({
    Key? key, this.isButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(isButton == false)
        Container(
          width: Get.width,
          height: defaultHeaderHeight,
          child: Image.asset(header_bg,fit: BoxFit.cover,),
        ),
        SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                   height: defaultHeaderHeight / 2,
                   margin:  EdgeInsets.only(left: isButton ? 0.0 : 20.0),
                   child: Image.asset(ic_logo,fit: BoxFit.cover,)),


              isButton ?   Container(
                child: ButtonWidget(
                    text: "Menu", onClicked: (){
                      Get.to(HomeScreen());
                }, width: 100.0, height: 40.0),
              )
               : Container(
                  height: 25,
                  margin: const EdgeInsets.only(right: 20),
                  child: Image.asset(ic_cart,fit: BoxFit.cover,)
              ),
             ],
            )
        )



      ],
    );
  }
}

