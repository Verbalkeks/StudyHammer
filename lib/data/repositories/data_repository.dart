import 'package:studyhammer/data/models/context_object.dart';
import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/subcategory.dart';

abstract class DataRepository {
  Future<ContextObject> readAllContext();
  Future<void> createQuestion(Question question, List<Answer> answers);
  Future<void> createCategory(Category category);
  Future<void> createSubcategory(Subcategory subcategory);
  Future<void> deleteCategory(String categoryId);
  Future<void> deleteSubcategory(String subcategoryId);
  Future<void> deleteQuestion(String questionId);
  Future<void> updateCategory(Category category);
  Future<void> updateQuestion(Question question, List<Answer> answers);
  Future<void> updateSubcategory(Subcategory subcategory);
}
