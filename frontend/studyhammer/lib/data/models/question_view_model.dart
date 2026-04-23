import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_type.dart';

class QuestionViewModel {
  Question question;
  List<Answer> answers;
  QuestionType questionType;
  QuestionViewModel({
    required this.question,
    required this.answers,
    required this.questionType,
  });
}