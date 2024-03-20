import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:la_vapiano/screen/food_items_list/food_items_list_screen.dart';

import '../model/Product.dart';

class ItemsListBuilder extends StatelessWidget {
  var productList;
  bool isHorizontal;
   ItemsListBuilder({super.key, this.productList, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:Get.height,
      width: Get.width,
      margin: EdgeInsets.all(10.0),
      alignment: AlignmentDirectional.center,
      child: Center(
          child:
          ListView.builder(
            itemCount: productList.length,
            itemBuilder: _buildListItem,
            shrinkWrap: true,
            scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
            physics: const BouncingScrollPhysics(),
          )
      ),
    );
  }
  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    return GestureDetector(
      onTap: (){
       Get.to(FoodItemsListScreen());
      },
      child: Container(
        width: 200,
        height: isHorizontal ? 300 : 230,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.contain,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Text(
                product.title,
                style:  TextStyle(
                    fontSize: isHorizontal ? 20.0 : 15.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text(
                  '\$${product.desc}',textAlign: TextAlign.center,
                  maxLines: 3,
                  style:  TextStyle(fontWeight: FontWeight.normal,fontSize: isHorizontal ? 12.0 : 10.0),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'IQD ${product.price}',
                style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
