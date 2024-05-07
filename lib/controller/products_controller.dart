
import 'package:get/get.dart';
import 'package:la_vapiano/API/model/product_model.dart';
import 'package:la_vapiano/API/services/api_services.dart';

class ProductsController extends GetxController{
  var isLoading = true.obs;

 var productList = <ProductModel>[].obs;

 final String foodName;
    var cateProduct;

  ProductsController(this.foodName,{this.cateProduct = "null"});

  fetchCategory(foodName,cateProduct) async{
    print("Food Name in Controller: ${foodName}");
    try{
      isLoading(true);
      var products;
      if(cateProduct == "null"){
        print("Run Not Filter");
        print(cateProduct);
         products = await ApiServices().fetchProducts(menuName: foodName);
      }else{
        print("Run Filter");
        print(cateProduct);
        products = await ApiServices().fetchFilterProducts(menuName: foodName, subCatMenu: cateProduct);
      }

      productList.addAll(products);

      print("Product List in Controller: ${productList[1].en}");

    }catch(e){
      print("Exception in Controller: ${e.toString()}");
    }
    finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchCategory(foodName,cateProduct);
    super.onInit();
  }
}