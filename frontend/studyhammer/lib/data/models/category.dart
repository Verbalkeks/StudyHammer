import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/subcategory.dart';

class Category {
  final String name;
  final String description;
  final List<Subcategory> subcategories; // verfügbare Subcategories der Kategorie
  final List<Question> questions;

  Category({
    required this.name,
    required this.description,
    this.subcategories = const [],
    this.questions = const [],
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name:          json['name'],
    description:   json['description'],
    subcategories: (json['subcategories'] as List? ?? [])
        .map((s) => Subcategory.fromJson(s))
        .toList(),
    questions:     (json['questions'] as List? ?? [])
        .map((q) => Question.fromJson(q))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'name':          name,
    'description':   description,
    'subcategories': subcategories.map((s) => s.toJson()).toList(),
    'questions':     questions.map((q) => q.toJson()).toList(),
  };

  // Hilfsmethode zum Filtern
  List<Question> questionsBySubcategory(String subName) =>
      questions.where((q) => q.subcategory?.name == subName).toList();
}