import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/food_menu_screen/food_details_screen.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:provider/provider.dart';
import '../../API/Api.dart';
import '../../controller/products_controller.dart';
import '../../provider/language_code_provider.dart';
import '../../utils/constants.dart';
import '../../widget/simple_header.dart';

class FoodItemsListScreen extends StatelessWidget {
  final String foodName;
   FoodItemsListScreen({super.key, required this.foodName});



   @override
  Widget build(BuildContext context) {
     final languageController = Provider.of<LanguageCodeProvider>(context,listen: false);
     var productsController = Get.put(ProductsController(foodName));

    return  Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: Obx((){
          if(productsController.isLoading.value){
            return const Center(
              child: CircularProgressIndicator(color: Colors.red,),
            );
          }
          return Stack(
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
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: productsController.productList.length,
                        itemBuilder: (context,index){
                          return _buildListItem(context,index,productsController,languageController);
                        }
                    )
                ),
              ),

              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  height: Get.height / 1.2,
                  width: Get.width/2,
                  margin: EdgeInsets.only(top: Get.height/11.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: productsController.productList.length,
                      itemBuilder: (context,index){
                        return  _buildListItem(context,index,productsController,languageController);
                      }
                  ),
                ),
              )

              // Align(
              //   alignment: AlignmentDirectional.topStart,
              //   child: Container(
              //               height: Get.height / 1.3,
              //               width: Get.width/2,
              //               margin: EdgeInsets.only(top: Get.height/6.0),
              //               child: ItemsListBuilder(foodName: "productList",isHorizontal: false,),
              //             ),
              // ),
              //
              // Align(
              //   alignment: AlignmentDirectional.topEnd,
              //   child: Container(
              //     height: Get.height / 1.2,
              //     width: Get.width/2,
              //     margin: EdgeInsets.only(top: Get.height/11.0),
              //     child: ItemsListBuilder(foodName: "spanishFoodList",isHorizontal: false,),
              //   ),
              // )

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
          );
        })
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index,ProductsController controller,LanguageCodeProvider languageCodeProvider) {
    return GestureDetector(
      onTap: (){
        Get.to(FoodDetailsScreen(productList: controller.productList,index: index,));
      },
      child: Container(
        width: 200,
        height: 350 ,
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
              Container(
                child: Image.network(
                  "$API_IMAGE_URL${controller.productList[index].image}",
                  fit: BoxFit.cover,
                  width: 200,height: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Center(
                child: Text(
                  languageCodeProvider.languageCode == "en" ? controller.productList[index].en
                      :  languageCodeProvider.languageCode == "ku" ? controller.productList[index].ku :
                  controller.productList[index].ar,
                  maxLines: 1,
                  style:  TextStyle(
                    fontSize:  18.0, fontWeight: FontWeight.bold,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text(
                  '\$${
                      languageCodeProvider.languageCode == "en" ? controller.productList[index].descen
                          :  languageCodeProvider.languageCode == "ku" ? controller.productList[index].descku :
                      controller.productList[index].descar
                  }',textAlign: TextAlign.center,
                  maxLines: 2,
                  style:  TextStyle(fontWeight: FontWeight.normal,fontSize:  12.0 ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'IQD ${ controller.productList[index].price}',
                style: const TextStyle(color: primaryColor,fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
