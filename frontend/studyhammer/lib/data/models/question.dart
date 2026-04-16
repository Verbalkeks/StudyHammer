import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/pocket.dart';
import 'package:studyhammer/data/models/question_type.dart';
import 'package:studyhammer/data/models/subcategory.dart';
import 'package:uuid/uuid.dart';

class Question {
  static final Uuid _uuid = Uuid();
  final String id;
  final QuestionType questionType;
  final Subcategory? subcategory;
  final Pocket? pocket;
  final DateTime? timeInPocket;
  final String question;
  final List<Answer> answers;

  Question({
    required this.question,
    required this.questionType,
    required this.answers,
    this.subcategory, required id,
    this.pocket, this.timeInPocket,
  }
  ) : id =_uuid.v4();

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id:       json['id'],
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
    'id':       id,
    'question':     question,
    'questionType': questionType.name,
    'answers':      answers.map((a) => a.toJson()).toList(),
    'subcategory':  subcategory?.toJson(),
  };
}