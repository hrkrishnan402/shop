// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  int brandId;
  String productName;
  int offerPrice;
  int price;
  String description;
  int status;
  int hsncode;
  int priority;
  String prate;
  DateTime createdAt;
  String updatedAt;
  int? tax;
  String images;

  Product({
    required this.id,
    required this.brandId,
    required this.productName,
    required this.offerPrice,
    required this.price,
    required this.description,
    required this.status,
    required this.hsncode,
    required this.priority,
    required this.prate,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        brandId: json["brand_id"],
        productName: json["product_name"],
        offerPrice: json["offer_price"],
        price: json["price"],
        description: json["description"],
        status: json["status"],
        hsncode: json["hsncode"],
        priority: json["priority"],
        prate: json["prate"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand_id": brandId,
        "product_name": productName,
        "offer_price": offerPrice,
        "price": price,
        "description": description,
        "status": status,
        "hsncode": hsncode,
        "priority": priority,
        "prate": prate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "tax": tax,
        "images": images,
      };
}
