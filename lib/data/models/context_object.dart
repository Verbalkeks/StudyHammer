import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_progress.dart';
import 'package:studyhammer/data/models/subcategory.dart';

/*
Diese Klasse repräsentiert ein Kontextobjekt, 
dieses Objekt kommt aus Repository
und wurde dort aus dem lokalen Speicher geladen.
Hier sind alle Fragen, Kategorien,
Unterkategorien und Fortschritte enthalten.
Dieses Objekt dient als Datenquelle für die UI bzw.
für die Filterung von Fragen.
*/

class ContextObject {
  final List<Category> categories;
  final List<Subcategory> subcategories;
  final List<Question> questions;
  final List<Answer> answers;
  final List<QuestionProgress> questionProgresses;

  ContextObject({
    required this.categories,
    required this.subcategories,
    required this.questions,
    required this.answers,
    required this.questionProgresses,
  });

  @override
  toString() {
    return 'ContextObject{categories: $categories, subcategories: $subcategories, questions: $questions, answers: $answers, questionProgresses: $questionProgresses}';
  }
}
