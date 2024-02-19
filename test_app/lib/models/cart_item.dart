// To parse this JSON data, do
//
//     final cartItem = cartItemFromJson(jsonString);

import 'dart:convert';

CartItem cartItemFromJson(String str) => CartItem.fromJson(json.decode(str));

String cartItemToJson(CartItem data) => json.encode(data.toJson());

class CartItem {
    int id;
    int shopId;
    int productId;
    int qty;
    DateTime createdAt;
    DateTime updatedAt;
    int offerPrice;
    int price;
    String productName;
    String description;
    String images;

    CartItem({
        required this.id,
        required this.shopId,
        required this.productId,
        required this.qty,
        required this.createdAt,
        required this.updatedAt,
        required this.offerPrice,
        required this.price,
        required this.productName,
        required this.description,
        required this.images,
    });

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        shopId: json["shop_id"],
        productId: json["product_id"],
        qty: json["qty"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        offerPrice: json["offer_price"],
        price: json["price"],
        productName: json["product_name"],
        description: json["description"],
        images: json["images"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "product_id": productId,
        "qty": qty,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "offer_price": offerPrice,
        "price": price,
        "product_name": productName,
        "description": description,
        "images": images,
    };
}
