import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/widget/text_widget.dart';

class FoodContainer extends StatelessWidget {
  final String title,image,desc,price;
  const FoodContainer({super.key, required this.title, required this.image, required this.desc, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.0,
            child: Image.asset(image,fit: BoxFit.contain,),
          ),
          SizedBox(height: 10.0,),
         TextWidget(text: title, size: 20.0,color: Colors.black,),
          SizedBox(height: 10.0,),
          Text(desc,textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0,),),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}
