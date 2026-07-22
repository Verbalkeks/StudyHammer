import 'package:uuid/uuid.dart';
class Subcategory {
  String id;
  String categoryId;
  String name;
  String description;
  Subcategory({
    String?id,
    required this.categoryId,
    required this.name,
    required this.description
  }) : id = id ?? const Uuid().v7();

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'description': description,
    };
  }
}