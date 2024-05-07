import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/API/Api.dart';
import 'package:la_vapiano/controller/SubCategoryController.dart';
import 'package:la_vapiano/controller/products_controller.dart';

import 'package:la_vapiano/screen/must_login/must_login_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/language_code_provider.dart';
import '../food_items_list/food_items_list_screen.dart';


class FoodMenuScreen extends StatefulWidget {
  final String menuName;
  FoodMenuScreen({super.key, required this.menuName});

  @override
  State<FoodMenuScreen> createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageCodeProvider>(context,listen: false);
    print("Food Menu in Context: ${widget.menuName}");
    var subCategoryController = Get.put(SubCategoryController(widget.menuName));
    var productsController = Get.put(ProductsController(widget.menuName));
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              SizedBox(height: 20.0,),
              Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextWidget(text: "Find Your", size: 22.0, isBold: false,color: Colors.black,)),
              SizedBox(height: 10.0,),
              Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextWidget(text: "Best Food Here", size: 22.0, isBold: true,color: Colors.black,)),




              Container(
                height: 50.0,
                margin: const EdgeInsets.all(10.0),
                child: Obx((){
                  if(subCategoryController.isLoading.value){
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.red,),
                    );
                  }
                  return  ListView.builder(
                      itemCount: subCategoryController.subCategoryList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(10.0),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.black.withOpacity(0.1),
                               spreadRadius: 1,
                               blurRadius: 5,
                               offset: const Offset(0, 3), // changes position of shadow
                             ),
                           ]
                         ),
                          child: GestureDetector(
                            onTap: (){
                              print("Current Click Name: ${subCategoryController.subCategoryList[index].en}");
                              productsController.fetchCategory(widget.menuName,subCategoryController.subCategoryList[index].en);
                            },
                            child: Container(
                                width: 100.0,
                                child: Center(child:
                                TextWidget(text:

                                provider.languageCode == "en" ? subCategoryController.subCategoryList[index].en.toString()
                                    :  provider.languageCode == "ku" ? subCategoryController.subCategoryList[index].ku.toString() :
                                subCategoryController.subCategoryList[index].ar.toString()
                                    ,size: 12.0,color: Colors.black,))),
                          ),
                        );
                      }
                  );
                }),
              ),


              ///
              productsController.productList.length !=null ?  Obx(()  {
                if(productsController.isLoading.value){

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return  Container(
                    margin: const EdgeInsets.only(left: 0.0, top: 20.0),
                    height: 350,
                    width: double.maxFinite,
                    child:   ListView.builder(
                      itemCount: productsController.productList.length,
                      itemBuilder: (context,index){
                        print("Length: ${productsController.productList.length}");
                        return  GestureDetector(
                          onTap: (){
                            Get.to(FoodItemsListScreen(foodName: widget.menuName,));
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

                                  productsController.productList[index].image !=null ?

                                  Container(
                                    child: Image.network(
                                      "$API_IMAGE_URL${productsController.productList[index].image}",
                                      fit: BoxFit.cover,
                                      width: 200,height: 200,
                                    ),
                                  ) : Container(),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  productsController.productList[index].en !=null ?
                                  Center(
                                    child: Text(
                                      provider.languageCode == "en" ? productsController.productList[index].en
                                          :  provider.languageCode == "ku" ? productsController.productList[index].ku :
                                      productsController.productList[index].ar,
                                      maxLines: 1,
                                      style:  TextStyle(
                                        fontSize:  18.0, fontWeight: FontWeight.bold,),
                                    ),
                                  ) : Container(),

                                  productsController.productList[index].descen !=null ?
                                 
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                    child: Text(
                                      '\$${
                                          provider.languageCode == "en" ? productsController.productList[index].descen
                                              :  provider.languageCode == "ku" ? productsController.productList[index].descku :
                                          productsController.productList[index].descar
                                      }',textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style:  TextStyle(fontWeight: FontWeight.normal,fontSize:  12.0 ),
                                    ),
                                  ) : Container(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  productsController.productList[index].price !=null ?
                                  Text(
                                    'IQD ${ productsController.productList[index].price}',
                                    style: const TextStyle(color: primaryColor,fontWeight: FontWeight.bold),
                                  ) : Text("")
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      scrollDirection:Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                    )
                );
              }) : Container(),


              SizedBox(height: 30.0,),
              InkWell(
                onTap: (){
                  Get.to(const MustLoginScreen());
                },
                child: Container(
                  width: Get.width,
                  height: 50.0,
                  margin: EdgeInsets.only(left: 20.0,right: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primaryColor
                  ),
                  child: Center(child: TextWidget(text: "Delivery From 11AM-11PM",size: 14.0,isBold: true,)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index,ProductsController controller,LanguageCodeProvider languageCodeProvider) {
    return GestureDetector(
      onTap: (){
       // Get.to(FoodItemsListScreen());
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

