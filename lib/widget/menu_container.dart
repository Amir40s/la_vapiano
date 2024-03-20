import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/text_widget.dart';

class MenuContainer extends StatelessWidget {
  final String text,image;
  double textSize;
   MenuContainer({super.key, required this.text, required this.image,this.textSize = 16.0});



  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children:[
        Opacity(
          opacity: 0.3,
          child: Container(
            width: Get.width,
            height: 60,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10.0)
            ),
            padding: EdgeInsets.all(10.0),
          ),
        ),
        Container(
          width: Get.width,
          margin: EdgeInsets.only(left: 10.0,right: 10.0),
          child: Row(
            children: [
              Container(
                height: 50,
                child: Image.asset(image.toString()),
              ),
              SizedBox(width: 10.0,),
              TextWidget(text: text, size: textSize,color: Colors.white,isBold: true,)
            ],
          ),
        ),
      ]
    );
  }
}
