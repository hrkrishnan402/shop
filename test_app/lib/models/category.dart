class Category {
  int id;
  String categoryName;
  int catId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int status;

  Category({
    required this.id,
    required this.categoryName,
    required this.catId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["category_name"],
        catId: json["cat_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "cat_id": catId,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
      };
}
