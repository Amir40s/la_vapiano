import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/text_widget.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(text: 'Delivery',),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextWidget(text: "Shipping", size: 22.0,isBold: true,color: Colors.black,),
            ),
            Container(
              width: Get.width,
              color: primaryColor,
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: _buildItems
              ),
            ),
            SizedBox(height: 10.0,),
            Image.asset(bike_image,width: Get.width,height: 250.0,)
          ],
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context,int index){
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(text: "Order Location", size: 14.0,color: Colors.black,isBold: true,),
          Row(
            children: [
              Container(
                  width: 30.0,
                  height: 30.0,
                  child: Image.asset(ic_ship_location)),
              SizedBox(width: 10.0,),
              Container(
                width: Get.width/2,
                  child: TextWidget(text: "8502 Preston Rd. Inglewood,Maine 98380", size: 12.0,color: Colors.black,isBold: false,)),
            ],
          ),
        ]
      )
    );

  }
}
