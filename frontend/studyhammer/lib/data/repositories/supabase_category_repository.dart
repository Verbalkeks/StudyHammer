import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/repositories/category_repository.dart';

class SupabaseCategoryRepository implements CategoryRepository{
  @override
  Future<void> addCategory(Category newCategory) {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory(String name) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> loadAll() {
    // TODO: implement loadAll
    throw UnimplementedError();
  }

  @override
  Future<void> updateCategory(String name, Category updatedCategory) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}