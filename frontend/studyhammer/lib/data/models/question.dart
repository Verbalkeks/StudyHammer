import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/question_type.dart';
import 'package:studyhammer/data/models/subcategory.dart';

class Question {
  final String question;
  final QuestionType questionType;
  final List<Answer> answers;
  final Subcategory? subcategory; // optional, nur zum Filtern

  Question({
    required this.question,
    required this.questionType,
    required this.answers,
    this.subcategory,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question:     json['question'],
    questionType: QuestionType.values.byName(json['questionType']),
    answers:      (json['answers'] as List)
        .map((a) => Answer.fromJson(a))
        .toList(),
    subcategory: json['subcategory'] != null
        ? Subcategory.fromJson(json['subcategory'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'question':     question,
    'questionType': questionType.name,
    'answers':      answers.map((a) => a.toJson()).toList(),
    'subcategory':  subcategory?.toJson(),
  };
}