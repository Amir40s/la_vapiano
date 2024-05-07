
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/API/Api.dart';
import 'package:la_vapiano/controller/categoryController.dart';
import 'package:la_vapiano/screen/food_menu_screen/food_menu_screen.dart';
import 'package:la_vapiano/screen/home/home_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/menu_container.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';
import '../../provider/language_code_provider.dart';

class ItemsMenuScreen extends StatelessWidget {
  ItemsMenuScreen({super.key});

  var categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    print("language code: ${provider.languageCode}");
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
              Header(text: '',),
              TextWidget(text: "Delivery From 11 AM - 11 PM", size: 22.0, isBold: true,color: Colors.black,),
              SizedBox(height: 20,),
              TextWidget(text: "Our Menu", size: 24.0, isBold: true,color: primaryColor,),
                          ],
              )
          ),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  if(categoryController.isLoading.value){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return DynamicHeightGridView(
                      itemCount: categoryController.model!.data!.length,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0,
                      physics:  BouncingScrollPhysics(),
                      builder: (context,index){
                        return Container(
                          margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
                          child: GestureDetector(
                              onTap: (){
                                Get.to(HomeScreen(menuName: categoryController.model!.data![index].en.toString(),));
                              },
                              child: MenuContainer(
                                isTransparent: true,
                                text:  provider.languageCode == "en" ? categoryController.model!.data![index].en.toString()
                                    :  provider.languageCode == "ku" ? categoryController.model!.data![index].ku.toString() :
                                categoryController.model!.data![index].ar.toString(),

                                image: "$API_IMAGE_URL${categoryController.model?.data?[index].image.toString()}",
                              )),
                        );
                      });
                })
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

