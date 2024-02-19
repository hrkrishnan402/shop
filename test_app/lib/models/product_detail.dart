class ProductDetails {
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
    DateTime updatedAt;
    int catId;
    List<String> images;

    ProductDetails({
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
        required this.catId,
        required this.images,
    });

    factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
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
        updatedAt: DateTime.parse(json["updated_at"]),
        catId: json["cat_id"],
        images: List<String>.from(json["images"].map((x) => x)),
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
        "updated_at": updatedAt.toIso8601String(),
        "cat_id": catId,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
