import 'dart:convert';
import 'package:test_app/models/cart_item.dart';
import 'package:test_app/models/category.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/models/product_detail.dart';
import 'package:test_app/network/http_handler.dart';
import 'package:test_app/repository/api/api_repository_implementation.dart';

class ApiRepository implements ApiRepositoryImplementation {
  HttpHandler httpHandler;

  ApiRepository(this.httpHandler);
  @override
  Future<List<Category>> getCategory(String url) async {
    final response = await httpHandler.get(url);
    final data = jsonDecode(response.data)['categorylist'] as List;
    final productList = data.map((e) => Category.fromJson(e)).toList();
    return productList;
  }

  @override
  Future<List<Product>> getProducts(String url) async {
    final response = await httpHandler.post(url, {"index": "1"});
    final data = jsonDecode(response.data)['product'] as List;
    final productList = data.map((e) => Product.fromJson(e)).toList();
    return productList;
  }

  @override
  Future<ProductDetails> getProductDetails(String url, Map body) async {
    final response = await httpHandler.post(url, body, primaryUrl: false);
    final data = response.data['productdetails'][0];
    final result = ProductDetails.fromJson(data);
    return result;
  }

  @override
  Future<List<Product>> searchProduct(String url, Map body) async {
    final response = await httpHandler.post(url, body, primaryUrl: false);
    final data = jsonDecode(response.data)['product'] as List;
    final productList = data.map((e) => Product.fromJson(e)).toList();
    return productList;
  }

  @override
  Future<List<CartItem>> getCartItems(String url, Map body) async {
    final response = await httpHandler.post(url, body, primaryUrl: false);
    final data = jsonDecode(response.data)['cart'] as List;
    final cartItemList = data.map((e) => CartItem.fromJson(e)).toList();
    return cartItemList;
  }

  @override
  Future<void> addToCart(String url, Map body) async {
    final response = await httpHandler.post(url, body, primaryUrl: false);
    print(response);
  }
}
