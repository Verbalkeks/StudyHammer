import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_type.dart';
import 'package:studyhammer/data/models/question_view_model.dart';
import 'package:studyhammer/data/repositories/data_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDataRepository implements DataRepository {
  final SupabaseClient _client;
  SupabaseDataRepository(this._client);
  @override
  Future<List<Category>> loadAllCategorys() async {
    final List data = await _client
        .from('category')
        .select('*')
        .order('category_name', ascending: true);

    return data.cast<Map<String, dynamic>>().map(Category.fromJson).toList();
  }

  @override
  Future<List<Question>> loadQuestionsByCategory(int id) async {
    final List data = await _client
        .from('question')
        .select('*')
        .eq('cid', id)
        .order('id', ascending: true);

    return data.cast<Map<String, dynamic>>().map(Question.fromJson).toList();
  }

  @override
  Future<List<QuestionViewModel>> getQuestionViewModels(int id) async {
    try {
      final List data = await _client
          .from('question')
          .select('*, answer(*), question_type(*)')
          .eq('cid', id)
          .order('id', ascending: true);

      return data.cast<Map<String, dynamic>>().map((json) {
        final question = Question.fromJson(json);

        final answers = (json['answer'] as List)
            .cast<Map<String, dynamic>>()
            .map(Answer.fromJson)
            .toList();

        final questionType = QuestionType.fromJson(
          json['question_type'] as Map<String, dynamic>,
        );

        return QuestionViewModel(
          question: question,
          answers: answers,
          questionType: questionType,
        );
      }).toList();
    } catch (e) {
      throw Exception('Fehler beim Laden der Fragen: $e');
    }
  }

  @override
  Future<List<Answer>> loadAnswersByQuestion(int id) async {
    final List data = await _client
        .from('answer')
        .select('*')
        .eq('qid', id)
        .order('qid', ascending: true);

    return data.cast<Map<String, dynamic>>().map(Answer.fromJson).toList();
  }
  
  
  @override
  Future<List<QuestionType>> loadAllQuestionTypes() async {
    final List data = await _client
        .from('question_type')
        .select('*')
        .order('id', ascending: true);
    return data
        .cast<Map<String, dynamic>>()
        .map(QuestionType.fromJson)
        .toList();
  }

  @override
  Future<void> addCategory(Category newCategory) {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<void> addQuestionWithAnswers(Question question, List<Answer> answers) {
    // TODO: implement addQuestionWithAnswers
    throw UnimplementedError();
  }

  @override
  Future<void> updateQuestionWithAnswers(
    int id,
    Question updatedQuestion,
    List<Answer> answers,
  ) {
    // TODO: implement updateQuestionWithAnswers
    throw UnimplementedError();
  }

  @override
  Future<void> updateCategory(int id, Category updatedCategory) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteQuestionWithAnswers(int id) {
    // TODO: implement deleteQuestionWithAnswers
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory(int id) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }
}
