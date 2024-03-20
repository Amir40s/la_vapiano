import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/food_menu_screen/food_menu_screen.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/menu_container.dart';
import 'package:la_vapiano/widget/text_widget.dart';

class ItemsMenuScreen extends StatelessWidget {
  ItemsMenuScreen({super.key});


 final List image = [ic_italian_food,ic_special_foods,ic_spanish_food,ic_burger,ic_maxicon_foods,ic_kids_food,ic_pastry,
   ic_healthy_foods,ic_drinks,ic_shisha];
 final List text = ['Itallan Food','Special Food','Spanish Food ','Burger','Mexican Food','Kids Meal','Pastry','Healthy Food'
                    ,'Drink','Shisha'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primaryColor,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background_main),
            fit: BoxFit.cover,
          )
        ),
        child: Stack(
          children: [
            Header(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(text: "Delivery From 11 AM - 11 PM", size: 22.0, isBold: true),
                  SizedBox(height: 20,),
                  TextWidget(text: "Our Menu", size: 20.0, isBold: true,fontFamily: oleoFont,),
                  Center(
                    child: DynamicHeightGridView(
                        itemCount: text.length,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                        physics: const BouncingScrollPhysics(),
                        builder: (context,index){
                          return Container(
                            margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
                            child: GestureDetector(
                                onTap: (){
                                  Get.to(FoodMenuScreen());
                                },
                                child: MenuContainer(text: text[index], image: image[index],textSize: 12.0,)),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

