import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_type.dart';

class QuizObject {
  Question question;
  List<Answer> answers;
  QuestionType questionType;
  QuizObject({
    required this.question,
    required this.answers,
    required this.questionType,
  });
}