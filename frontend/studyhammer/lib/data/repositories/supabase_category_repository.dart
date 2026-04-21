import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/repositories/category_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCategoryRepository implements CategoryRepository {
  final SupabaseClient _client;
  SupabaseCategoryRepository(this._client);
  @override
  Future<List<Category>> loadAllCategorys() async {
    final List data = await _client
        .from('category')
        .select('*')
        .order('name', ascending: true);

    return data
        .cast<Map<String, dynamic>>()
        .map(Category.fromJson)
        .toList();
  }

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
  Future<void> updateCategory(String name, Category updatedCategory) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}
