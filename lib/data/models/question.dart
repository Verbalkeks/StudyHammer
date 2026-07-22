import 'package:uuid/uuid.dart';
import 'package:studyhammer/data/models/question_type.dart';

class Question {
  String id;
  String categoryId;
  String? subcategoryId;
  QuestionType questionType;
  String text;

  Question({
    String? id,
    required this.categoryId,
    this.subcategoryId,
    required this.questionType,
    required this.text,
  }) : id = id ?? const Uuid().v7();

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      subcategoryId: json['subcategoryId'] as String?,
      questionType: QuestionType.values.byName(json['questionType'] as String),
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'subcategoryId': subcategoryId,
      'questionType': questionType.name,
      'text': text,
    };
  }
}
