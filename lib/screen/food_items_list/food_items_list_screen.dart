import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/food_menu_screen/components/items_list_builder.dart';
import 'package:la_vapiano/widget/button_widget.dart';

import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../../widget/simple_header.dart';
import '../../widget/text_widget.dart';
import '../food_menu_screen/model/Product.dart';

class FoodItemsListScreen extends StatelessWidget {
   FoodItemsListScreen({super.key});

  List<Product> productList = [
    Product(italian_food_image,"Italian Food",items_desc,120.0),
    Product(italian_food_image,"Italian Food",items_desc,120.0),
   Product(italian_food_image,"Italian Food",items_desc,120.0),
   Product(italian_food_image,"Italian Food",items_desc,120.0),
   Product(italian_food_image,"Italian Food",items_desc,120.0),
  ];

   List<Product> spanishFoodList = [
     Product(italian_food_image,spanish_food_text,items_desc,120.0),
     Product(italian_food_image,spanish_food_text,items_desc,120.0),
     Product(italian_food_image,spanish_food_text,items_desc,120.0),
     Product(italian_food_image,spanish_food_text,items_desc,120.0),
     Product(italian_food_image,spanish_food_text,items_desc,120.0),
     Product(italian_food_image,spanish_food_text,items_desc,120.0),
   ];


   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleHeader(),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: ButtonWidget(text: "Salad",
                    onClicked: (){},
                    width: Get.width/4, height: 30.0,backgroundColor: Colors.red,),
                ),
              ],
            ),

            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                          height: Get.height / 1.3,
                          width: Get.width/2,
                          margin: EdgeInsets.only(top: Get.height/6.0),
                          child: ItemsListBuilder(productList: productList,isHorizontal: false,),
                        ),
            ),

            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                height: Get.height / 1.2,
                width: Get.width/2,
                margin: EdgeInsets.only(top: Get.height/11.0),
                child: ItemsListBuilder(productList: spanishFoodList,isHorizontal: false,),
              ),
            )

            // Container(
            //   margin: EdgeInsets.only(top: Get.height/5.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children:[
            //         Container(
            //           height: Get.height / 1.3,
            //           width: Get.width/2,
            //           child: ItemsListBuilder(productList: productList,isHorizontal: false,),
            //         ),
            //         Container(
            //           height: Get.height / 1.3,
            //           width: Get.width/2,
            //           child: ItemsListBuilder(productList: productList,isHorizontal: false,),
            //         ),
            //         // Container(
            //         //   child: SingleChildScrollView(
            //         //     child: Column(
            //         //       children: [
            //         //         ItemsListBuilder(productList: productList,isHorizontal: false,),
            //         //       ],
            //         //     ),
            //         //   ),
            //         // ),
            //
            //       ]
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
