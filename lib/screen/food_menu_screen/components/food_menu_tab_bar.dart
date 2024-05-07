import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vapiano/utils/constants.dart';

import '../../../utils/app_text.dart';

class FoodsTabBar extends StatefulWidget {
  final TabController controller;
  const FoodsTabBar({super.key, required this.controller});

  @override
  State<FoodsTabBar> createState() => _FoodsTabBarState();
}

class _FoodsTabBarState extends State<FoodsTabBar> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 30.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        // boxShadow: [
        //   BoxShadow(
        //       color: Colors.grey.withOpacity(0.3),
        //       blurRadius: 30,
        //       offset: const Offset(0, 10)),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                controller: widget.controller,
                backgroundColor: primaryColor,
                unselectedBackgroundColor:
                Colors.grey.withOpacity(0.2),
                labelStyle: const TextStyle(
                    color: Colors.white, //Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                unselectedLabelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                unselectedBorderColor: Colors.grey,
                contentPadding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 20, right: 20),
                buttonMargin:
                const EdgeInsets.symmetric(horizontal: 20),
                radius: 15,
                tabs:  [
                  Tab(icon: Icon(Icons.arrow_right_alt),text: italian_food_text),
                  Tab(icon: Icon(Icons.arrow_right_alt),text: special_food_text),
                  Tab(icon: Icon(Icons.arrow_right_alt),text: spanish_food_text),
                  Tab(icon: Icon(Icons.arrow_right_alt),text: kids_meal_text),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Tab(icon: Icon(Icons.arrow_right_alt),text: italian_food_text);
  }
}
