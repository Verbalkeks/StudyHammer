import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_type.dart';
import 'package:studyhammer/data/models/question_view_model.dart';

abstract class DataRepository {
  Future<List<Category>> loadAllCategorys();
  Future<List<Question>> loadQuestionsByCategory(int id);
  Future<List<Answer>> loadAnswersByQuestion(int id);
  Future<List<QuestionType>> loadAllQuestionTypes();
  Future<List<QuestionViewModel>> getQuestionViewModels(int id);
  Future<void> addQuestionWithAnswers(Question question, List<Answer> answers);
  Future<void> addCategory(Category newCategory);
  Future<void> updateQuestionWithAnswers(int id, Question updatedQuestion, List<Answer> answers);
  Future<void> updateCategory(int id, Category updatedCategory);
  Future<void> deleteQuestionWithAnswers(int id);
  Future<void> deleteCategory(int id);
  }
