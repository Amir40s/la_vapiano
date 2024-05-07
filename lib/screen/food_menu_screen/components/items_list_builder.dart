// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:la_vapiano/API/Api.dart';
// import 'package:la_vapiano/screen/food_items_list/food_items_list_screen.dart';
// import 'package:la_vapiano/utils/constants.dart';
//
// import '../../../controller/products_controller.dart';
//
// class ItemsListBuilder extends StatelessWidget {
//   String foodName;
//   bool isHorizontal;
//    ItemsListBuilder({super.key, required this.foodName, this.isHorizontal = false});
//
//   @override
//   Widget build(BuildContext context) {
//     var productsController = Get.put(ProductsController(foodName));
//     return Container(
//       height:Get.height,
//       width: Get.width,
//       margin: EdgeInsets.all(10.0),
//       alignment: AlignmentDirectional.center,
//       child: Center(
//           child:
//           ListView.builder(
//             itemCount: productsController.productList.length,
//             itemBuilder: (context,index){
//               return _buildListItem(context,index,productsController);
//             },
//             shrinkWrap: true,
//             scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
//             physics: const BouncingScrollPhysics(),
//           )
//       ),
//     );
//   }
//   Widget _buildListItem(BuildContext context, int index,ProductsController controller) {
//     return GestureDetector(
//       onTap: (){
//       // Get.to(FoodItemsListScreen());
//       },
//       child: Container(
//         width: 200,
//         height: isHorizontal ? 300 : 230,
//
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         margin: EdgeInsets.all(5.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 10.0,),
//               Container(
//                 padding: EdgeInsets.only(left: 20.0,right: 20.0),
//                 child: Image.network(
//                  "$API_IMAGE_URL${controller.productList[index].image}",
//                   fit: BoxFit.contain,
//                   width: 200,
//                   height: 100,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//
//               Text(
//                 controller.productList[index].en,
//                 maxLines: 1,
//                 style:  TextStyle(
//                     fontSize: isHorizontal ? 20.0 : 15.0, fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10.0,right: 10.0),
//                 child: Text(
//                   '\$${ controller.productList[index].descen}',textAlign: TextAlign.center,
//                   maxLines: 2,
//                   style:  TextStyle(fontWeight: FontWeight.normal,fontSize: isHorizontal ? 12.0 : 10.0),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'IQD ${ controller.productList[index].price}',
//                 style: const TextStyle(color: primaryColor,fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
