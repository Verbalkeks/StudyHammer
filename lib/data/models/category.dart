import 'package:uuid/uuid.dart';

class Category {
  String id;
  String name;
  String description;

  Category({
    String? id,
    required this.name,
    required this.description
  }) : id = id ?? const Uuid().v7();

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description}';
  }
}
