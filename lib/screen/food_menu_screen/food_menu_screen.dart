import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/food_menu_screen/components/food_menu_tab_bar.dart';
import 'package:la_vapiano/screen/food_menu_screen/components/items_list_builder.dart';
import 'package:la_vapiano/screen/food_menu_screen/model/Product.dart';
import 'package:la_vapiano/screen/item_menu_screen/items_menu_screen.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/utils/app_text.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/food_container.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/menu_container.dart';
import 'package:la_vapiano/widget/simple_header.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class FoodMenuScreen extends StatefulWidget {
  FoodMenuScreen({super.key});

  @override
  State<FoodMenuScreen> createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen>  with TickerProviderStateMixin{
  List<Product> productList = [
    Product(italian_food_image,"Italian Food",items_desc,120.0),
    Product(italian_food_image,"Italian Food",items_desc,120.0),
    Product(italian_food_image,"Italian Food",items_desc,120.0),
  ];

  List<Product> specialFoodList = [
    Product(italian_food_image,special_food_text,items_desc,120.0),
    Product(italian_food_image,special_food_text,items_desc,120.0),
    Product(italian_food_image,special_food_text,items_desc,120.0),
  ];

  List<Product> spanishFoodList = [
    Product(italian_food_image,spanish_food_text,items_desc,120.0),
    Product(italian_food_image,spanish_food_text,items_desc,120.0),
    Product(italian_food_image,spanish_food_text,items_desc,120.0),
  ];

  List<Product> kidsFoodList = [
    Product(italian_food_image,kids_meal_text,items_desc,120.0),
    Product(italian_food_image,kids_meal_text,items_desc,120.0),
    Product(italian_food_image,kids_meal_text,items_desc,120.0),
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleHeader(),

              SizedBox(height: 20.0,),
              Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextWidget(text: "Find Your", size: 22.0, isBold: false,color: Colors.black,)),
              SizedBox(height: 10.0,),
              Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextWidget(text: "Best Food Here", size: 22.0, isBold: true,color: Colors.black,)),

              FoodsTabBar(controller: tabController),

              /// ==== Tab Bar View =====
              Container(
                margin: const EdgeInsets.only(left: 0.0, top: 20.0),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: tabController,
                  children: [
                    ItemsListBuilder(productList: productList,isHorizontal: true,),
                    ItemsListBuilder(productList: specialFoodList,isHorizontal: true,),
                    ItemsListBuilder(productList: spanishFoodList,isHorizontal: true,),
                    ItemsListBuilder(productList: kidsFoodList,isHorizontal: true,),
                  ],
                ),
              ),
            //  ItemsListBuilder(productList: productList,),
              SizedBox(height: 30.0,),
              Container(
                width: Get.width,
                height: 50.0,
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.red
                ),
                child: Center(child: TextWidget(text: "Delivery From 11AM-11PM",size: 14.0,isBold: true,)),
              )
            ],
          ),
        ),
      ),
    );
  }


}

