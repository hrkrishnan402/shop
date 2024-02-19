import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_app/common/constants/app_strings.dart';
import 'package:test_app/models/cart_item.dart';
import 'package:test_app/models/category.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/repository/api/api_repository.dart';

class HomePageController extends GetxController {
  ApiRepository _apiRepository;
  HomePageController(this._apiRepository);
  List<Category>? categoryList = [];
  List<Product>? productList = [];
  List<CartItem> cartItemList = [];

  @override
  void onInit() async {
    categoryList = await _apiRepository.getCategory(AppStrings.getCategoryList);
    productList = await _apiRepository.getProducts(AppStrings.getProductList);
    categoryList = categoryList!.sublist(0, 3);
    productList = productList!.sublist(0, 6);
    cartItemList = await _apiRepository
        .getCartItems(AppStrings.cartList, {"shop_id": "1329"});
    update();
    super.onInit();
  }
}
