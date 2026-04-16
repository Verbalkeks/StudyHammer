import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/models/subcategory.dart';
import 'package:studyhammer/data/models/question.dart';

class CategoryRepository {
  Future<Directory> get _localDir async {
    return await getApplicationDocumentsDirectory();
  }

  Future<File> get _dataFile async {
    final dir = await _localDir;
    return File('${dir.path}/categories.json');
  }

  // Laden und Speichern aller Kategorien

  Future<List<Category>> loadAll() async {
    final file = await _dataFile;
    if (!await file.exists()) return [];
    final content = await file.readAsString();
    final List data = jsonDecode(content);
    return data.map((c) => Category.fromJson(c)).toList();
  }

  Future<void> _saveAll(List<Category> categories) async {
    final file = await _dataFile;
    await file.writeAsString(jsonEncode(
      categories.map((c) => c.toJson()).toList(),
    ));
  }

  // CRUD Category

  Future<void> addCategory(Category category) async {
    final all = await loadAll();
    all.add(category);
    await _saveAll(all);
  }

  Future<void> deleteCategory(String name) async {
    final all = await loadAll();
    all.removeWhere((c) => c.name == name);
    await _saveAll(all);
  }

  Future<void> updateCategory(String name, Category updated) async {
    final all = await loadAll();
    final i = all.indexWhere((c) => c.name == name);
    if (i != -1) all[i] = updated;
    await _saveAll(all);
  }

  // CRUD Subcategory

  Future<void> addSubcategory(String categoryName, Subcategory sub) async {
    final all = await loadAll();
    final cat = all.firstWhere((c) => c.name == categoryName);
    final updated = Category(
      name:          cat.name,
      description:   cat.description,
      subcategories: [...cat.subcategories, sub],
      questions:     cat.questions,
    );
    await updateCategory(categoryName, updated);
  }

  Future<void> deleteSubcategory(String categoryName, String subName) async {
    final all = await loadAll();
    final cat = all.firstWhere((c) => c.name == categoryName);
    final updated = Category(
      name:          cat.name,
      description:   cat.description,
      subcategories: cat.subcategories
          .where((s) => s.name != subName)
          .toList(),
      questions:     cat.questions,
    );
    await updateCategory(categoryName, updated);
  }

  // CRUD Question

  Future<void> addQuestion(String categoryName, Question q) async {
    final all = await loadAll();
    final cat = all.firstWhere((c) => c.name == categoryName);
    final updated = Category(
      name:          cat.name,
      description:   cat.description,
      subcategories: cat.subcategories,
      questions:     [...cat.questions, q],
    );
    await updateCategory(categoryName, updated);
  }

  Future<void> deleteQuestion(String categoryName, int index) async {
    final all = await loadAll();
    final cat = all.firstWhere((c) => c.name == categoryName);
    final qs = [...cat.questions]..removeAt(index);
    final updated = Category(
      name:          cat.name,
      description:   cat.description,
      subcategories: cat.subcategories,
      questions:     qs,
    );
    await updateCategory(categoryName, updated);
  }

  Future<void> updateQuestion(String categoryName, int index, Question q) async {
    final all = await loadAll();
    final cat = all.firstWhere((c) => c.name == categoryName);
    final qs = [...cat.questions]..[index] = q;
    final updated = Category(
      name:          cat.name,
      description:   cat.description,
      subcategories: cat.subcategories,
      questions:     qs,
    );
    await updateCategory(categoryName, updated);
  }
}