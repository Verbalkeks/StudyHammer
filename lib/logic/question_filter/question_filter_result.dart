import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/models/pocket.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_type.dart';
import 'package:studyhammer/data/models/subcategory.dart';

class QuestionFilterResult {
  const QuestionFilterResult({
    required this.filteredQuestions,
    required this.availableCategories,
    required this.availableSubcategories,
    required this.availablePockets,
    required this.availableQuestionTypes,
  });

  final List<Question> filteredQuestions;
  final List<Category> availableCategories;
  final List<Subcategory> availableSubcategories;
  final List<Pocket> availablePockets;
  final List<QuestionType> availableQuestionTypes;
}
