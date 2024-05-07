
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';



class SimpleHeader extends StatelessWidget {
  bool isButton;
  SimpleHeader({
    Key? key, this.isButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
            child: Row(
             children: [
               InkWell(
                 onTap: (){
                   Get.back();
                 },
                 child: Container(
                     height: defaultHeaderHeight / 2,
                     margin:  EdgeInsets.only(left: isButton ? 0.0 : 20.0),
                     child: Image.asset(ic_back_fancy,fit: BoxFit.cover,)),
               ),


             Container(
               width: Get.width/1.5,
                child: Center(child:  Container(
                    height: 80.0,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Image.asset(ic_logo))
                ),)
              )
            ]
            )
        )



      ],
    );
  }
}

