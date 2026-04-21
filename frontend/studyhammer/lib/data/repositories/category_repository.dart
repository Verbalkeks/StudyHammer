import 'package:studyhammer/data/models/category.dart';

abstract class CategoryRepository {
  
  Future<List<Category>> loadAllCategorys();
  Future<void> addCategory(Category newCategory);
  Future<void> updateCategory(String name, Category updatedCategory);
  Future<void> deleteCategory(String name);
  }
