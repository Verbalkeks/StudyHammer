import 'dart:convert';
import 'dart:io';
import 'package:studyhammer/data/models/context_object.dart';
import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_progress.dart';
import 'package:studyhammer/data/models/subcategory.dart';
import 'package:studyhammer/data/repositories/data_repository.dart';
import 'package:path_provider/path_provider.dart';

class LocalRepository implements DataRepository {
  ContextObject contextObject = ContextObject(
    categories: [],
    subcategories: [],
    questions: [],
    answers: [],
    questionProgresses: [],
  );

  final directory = getApplicationSupportDirectory();
  @override
  Future<ContextObject> readAllContext() async {
    final categoriesJson = await _getLocalFileAsList('categories');
    final categories = categoriesJson
        .map((json) => Category.fromJson(json as Map<String, dynamic>))
        .toList();

    final subcategoriesJson = await _getLocalFileAsList('subcategories');
    final subcategories = subcategoriesJson
        .map((json) => Subcategory.fromJson(json as Map<String, dynamic>))
        .toList();

    final questionsJson = await _getLocalFileAsList('questions');
    final questions = questionsJson
        .map((json) => Question.fromJson(json as Map<String, dynamic>))
        .toList();

    final answersJson = await _getLocalFileAsList('answers');
    final answers = answersJson
        .map((json) => Answer.fromJson(json as Map<String, dynamic>))
        .toList();

    final questionProgressJson = await _getLocalFileAsList('question_progress');
    final questionProgresses = questionProgressJson
        .map((json) => QuestionProgress.fromJson(json as Map<String, dynamic>))
        .toList();

    return ContextObject(
      categories: categories,
      subcategories: subcategories,
      questions: questions,
      answers: answers,
      questionProgresses: questionProgresses,
    );
  }

  @override
  Future<void> createCategory(Category category) async {
    final categories = await _getCategories();
    categories.add(category);
    await _writeLocalList(
      'categories',
      categories.map((category) => category.toJson()).toList(),
    );
  }

  @override
  Future<void> createQuestion(Question question, List<Answer> answers) {
    // TODO: implement createQuestion
    throw UnimplementedError();
  }

  @override
  Future<void> createSubcategory(Subcategory subcategory) {
    // TODO: implement createSubcategory
    throw UnimplementedError();
  }

  @override
  Future<void> updateCategory(Category category) async {
    final categoryId = category.id;
    final categories = await _getCategories();
    final index = categories.indexWhere(
      (category) => category.id == categoryId,
    );
    if (index == -1) {
      throw StateError('Kategorie wurde nicht gefunden.');
    }

    categories[index] = category;
    await _writeLocalList(
      'categories',
      categories.map((category) => category.toJson()).toList(),
    );
  }

  @override
  Future<void> updateQuestion(Question question, List<Answer> answers) {
    // TODO: implement updateQuestion
    throw UnimplementedError();
  }

  @override
  Future<void> updateSubcategory(Subcategory subcategory) {
    // TODO: implement updateSubcategory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    final categories = await _getCategories();
    categories.removeWhere((category) => category.id == categoryId);

    final subcategories = await _getSubcategories();
    subcategories.removeWhere(
      (subcategory) => subcategory.categoryId == categoryId,
    );

    final questions = await _getQuestions();
    final deletedQuestionIds = questions
        .where((question) => question.categoryId == categoryId)
        .map((question) => question.id)
        .toSet();
    questions.removeWhere((question) => question.categoryId == categoryId);

    final answers = await _getAnswers();
    answers.removeWhere(
      (answer) => deletedQuestionIds.contains(answer.questionId),
    );

    final questionProgresses = await _getQuestionProgresses();
    questionProgresses.removeWhere(
      (progress) => deletedQuestionIds.contains(progress.questionId),
    );

    await _writeLocalList(
      'categories',
      categories.map((category) => category.toJson()).toList(),
    );
    await _writeLocalList(
      'subcategories',
      subcategories.map((subcategory) => subcategory.toJson()).toList(),
    );
    await _writeLocalList(
      'questions',
      questions.map((question) => question.toJson()).toList(),
    );
    await _writeLocalList(
      'answers',
      answers.map((answer) => answer.toJson()).toList(),
    );
    await _writeLocalList(
      'question_progress',
      questionProgresses.map((progress) => progress.toJson()).toList(),
    );
  }

  @override
  Future<void> deleteQuestion(String questionId) {
    // TODO: implement deleteQuestion
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSubcategory(String subcategoryId) {
    // TODO: implement deleteSubcategory
    throw UnimplementedError();
  }

  Future<List<dynamic>> _getLocalFileAsList(String objectType) async {
    /*
    ### Methode zum Abrufen lokaler Dateien
    ### Initial werden die lokalen Dateien erstellt, falls sie noch nicht existieren.
    */
    final supportDir = await directory;
    final dir = Directory(supportDir.path);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    final file = File('${dir.path}/$objectType.json');

    if (!await file.exists()) {
      await file.create();
      await file.writeAsString('[]');
    }

    final jsonString = await file.readAsString();

    if (jsonString.trim().isEmpty) {
      return [];
    }

    final decodedJson = jsonDecode(jsonString);

    if (decodedJson is List) {
      return decodedJson;
    } else {
      throw FormatException(
        '$objectType.json enthält keine gültige JSON-Liste.',
      );
    }
  }

  Future<List<Category>> _getCategories() async {
    final categoriesJson = await _getLocalFileAsList('categories');
    return categoriesJson
        .map((json) => Category.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Subcategory>> _getSubcategories() async {
    final subcategoriesJson = await _getLocalFileAsList('subcategories');
    return subcategoriesJson
        .map((json) => Subcategory.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Question>> _getQuestions() async {
    final questionsJson = await _getLocalFileAsList('questions');
    return questionsJson
        .map((json) => Question.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Answer>> _getAnswers() async {
    final answersJson = await _getLocalFileAsList('answers');
    return answersJson
        .map((json) => Answer.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<QuestionProgress>> _getQuestionProgresses() async {
    final questionProgressJson = await _getLocalFileAsList('question_progress');
    return questionProgressJson
        .map((json) => QuestionProgress.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> _writeLocalList(
    String objectType,
    List<Map<String, dynamic>> items,
  ) async {
    final supportDir = await directory;
    final dir = Directory(supportDir.path);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    final file = File('${dir.path}/$objectType.json');
    await file.writeAsString(jsonEncode(items));
  }
}
