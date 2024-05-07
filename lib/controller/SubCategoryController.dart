
import 'package:get/get.dart';
import 'package:la_vapiano/API/model/SubCategoryModel.dart';
import 'package:la_vapiano/API/services/api_services.dart';

class SubCategoryController extends GetxController{
  var isLoading = true.obs;

 var subCategoryList = <SubCategoryModel>[].obs;

 final String foodName;

  SubCategoryController(this.foodName);

  fetchCategory() async{
    try{
      isLoading(true);

      var subCategory = await ApiServices().fetchSubcategory(menuName: foodName);

      subCategoryList.addAll(subCategory);

    }catch(e){
      print(e);
    }
    finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }
}