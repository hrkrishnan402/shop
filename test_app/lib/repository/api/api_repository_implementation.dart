import 'package:test_app/models/cart_item.dart';
import 'package:test_app/models/product.dart';

import '../../models/category.dart';
import '../../models/product_detail.dart';

abstract class ApiRepositoryImplementation {
  Future<List<Category>> getCategory(String url);
  Future<List<Product>> getProducts(String url);
  Future<ProductDetails> getProductDetails(String url, Map body);
  Future<List<Product>> searchProduct(String url, Map body);
  Future<List<CartItem>> getCartItems(String url, Map body);
  Future<void> addToCart(String url, Map body);
}
