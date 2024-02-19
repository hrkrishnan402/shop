import 'package:get/get.dart';

import '../common/constants/app_strings.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../repository/api/api_repository.dart';

class ProductPageController extends GetxController {
  ApiRepository _apiRepository;
  ProductPageController(this._apiRepository);
  List<Category>? categoryList = [];
  List<Product>? productList = [];
  int selectedCategoryid = 0;

  @override
  void onInit() async {
    categoryList = await _apiRepository.getCategory(AppStrings.getCategoryList);
    productList = await _apiRepository.getProducts(AppStrings.getProductList);

    update();
    super.onInit();
  }

  Future<void> searchProduct(String searchKey) async {
    var searchBody = {"productname": searchKey, "index": 0};
    productList = await _apiRepository.searchProduct(
        AppStrings.searchProduct, searchBody);
    update();
  }

  Future<void> onCategorySelected(int id) async {
    selectedCategoryid = id;
    update();
  }
}
