class Subcategory {
  final String name;
  final String description;

  Subcategory({
    required this.name,
    required this.description,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    name:        json['name'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'name':        name,
    'description': description,
  };
}