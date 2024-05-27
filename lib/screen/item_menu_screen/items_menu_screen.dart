
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
import '../../utils/app_text.dart';

class ItemsMenuScreen extends StatelessWidget {
  ItemsMenuScreen({super.key});

  var categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    print("language code: ${provider.languageCode}");
    return Scaffold(
      backgroundColor:Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
        
            SingleChildScrollView(
                child: Container(
                width: Get.width,
                  child: Column(
                    mainAxisAlignment:  MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
        
                                Stack(
                                  children: [
                                    Header(text: '',),
        
                                   Align(
                                     alignment: AlignmentDirectional.center,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         if(provider.screenStatus =="menu")
                                           Container(
                                             margin: EdgeInsets.only(top: 50.0),
                                               padding: EdgeInsets.all(5.0),
                                               child: Image.asset(ic_logo,width: 200.0,height:
                                               200.0,color: primaryColor,)),
        
                                         if(provider.screenStatus =="delivery")
                                           Container(
                                               margin: EdgeInsets.only(top: 10.0),
                                               padding: EdgeInsets.all(5.0),
                                               child: Image.asset(bike_image,width: 250.0,height:
                                               250.0)),
                                       ],
                                     ),
                                   )
                                  ],
                                ),

                                SizedBox(height: 30.0,),
                                Consumer<LanguageCodeProvider>(
                                  builder: (context, provider,child){
                                    return Column(
                                      children: [
                                        if(provider.screenStatus =="delivery")
                                        TextWidget(text: provider.languageCode == "en" ? deliveryTimeText_en :
                                        provider.languageCode == "ku" ? deliveryTimeText_ku : deliveryTimeText_ar
                                          , size: 22.0,color: primaryColor,isBold: true,),
        
                                        if(provider.screenStatus =="delivery")
                                        TextWidget(text:
                                        provider.languageCode == "en" ? ourMenu_en :
                                        provider.languageCode == "ku" ? ourMenu_ku : ourMenu_ar, size: 24.0, isBold: true,color: primaryColor,
                                        ),
                                      ],
                                    );
                                  },
                                ),
        
        
        
        
                                Container(
                                  margin: EdgeInsets.only(top: 50.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Obx(() {
                                        if(categoryController.isLoading.value){
                                          return const Center(
                                            child: CircularProgressIndicator(color: primaryColor,),
                                          );
                                        }
                                        return DynamicHeightGridView(
                                            itemCount: categoryController.model!.data!.length,
                                            shrinkWrap: true,
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 2.0,
                                            crossAxisSpacing: 2.0,
                                            physics:  NeverScrollableScrollPhysics(),
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
                                ),
        
                              ],
        
        
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

