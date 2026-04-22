class Category {
  int? id;
  String categoryName;
  String categoryDescription;

  Category({
    this.id,
    required this.categoryName,
    required this.categoryDescription
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      categoryName: json['category_name'] as String,
      categoryDescription: json['categeroy_description']as String
    );
  }
}