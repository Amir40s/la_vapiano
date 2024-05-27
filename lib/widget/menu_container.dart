import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/text_widget.dart';

class MenuContainer extends StatelessWidget {
  final String text,image;
  double textSize;
   bool isTransparent;
   MenuContainer({super.key, required this.text, required this.image,this.textSize = 16.0,  this.isTransparent = false});



  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children:[
        Container(
          width: Get.width,
          height: 60,
          decoration: BoxDecoration(
              color: isTransparent ? primaryColor :  primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: isTransparent ? 2 : 0,
                blurRadius: isTransparent ? 5 : 0,
                offset: Offset( isTransparent ? 0 : 0, isTransparent ? 3 : 0), // changes position of shadow
              ),
            ]
          ),
          padding: EdgeInsets.all(10.0),
        ),
        Container(
          width: Get.width,
          margin: EdgeInsets.only(left: 10.0,right: 10.0),
          child: Row(
            children: [
              Container(
                height: 40.0,
                child: isTransparent ? Image.network(image.toString(),width: 40.0,height: 50.0,) : Image.asset(image.toString(),width: 40.0,height: 50.0,),
              ),
              SizedBox(width: 10.0,),
              AutoSizeText(
                text,
                minFontSize: 10,
                maxFontSize: 16,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
             // TextWidget(text: text, size: textSize,color: Colors.white,isBold: false,)
            ],
          ),
        ),
      ]
    );
  }
}
