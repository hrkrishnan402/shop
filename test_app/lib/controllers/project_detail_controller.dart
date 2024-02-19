import 'package:get/get.dart';
import 'package:test_app/common/constants/app_strings.dart';

import '../models/product_detail.dart';
import '../repository/api/api_repository.dart';

class ProductDetailController extends GetxController {
  ApiRepository _apiRepository;
  final int productId;

  ProductDetailController(this._apiRepository, this.productId);
  ProductDetails? productDetails;

  @override
  void onInit() async {
    productDetails = await _apiRepository.getProductDetails(
        AppStrings.getproductdetails, {"productid": "$productId"});
    update();

    super.onInit();
  }

  Future<void> addToCart() async {
    _apiRepository.addToCart(AppStrings.addToCart,
        {"shop_id": "1329", "product_id": productId, "qty": 1});
  }
}
