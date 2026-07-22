import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/data/repositories/data_repository.dart';
import 'package:studyhammer/logic/category_editor_state.dart';
import 'package:studyhammer/logic/manage_repository_cubit.dart';

class CategoryEditorCubit extends Cubit<CategoryEditorState> {
  CategoryEditorCubit({
    required this.repository,
    required this.manageRepositoryCubit,
  }) : super(CategoryEditorInitialState());

  final DataRepository repository;
  final ManageRepositoryCubit manageRepositoryCubit;

  Future<void> createCategory(Category category) async {
    await _save(() => repository.createCategory(category));
  }

  Future<void> updateCategory(Category category) async {
    await _save(() => repository.updateCategory(category));
  }

  Future<void> deleteCategory(String categoryId) async {
    await _save(() => repository.deleteCategory(categoryId));
  }

  Future<void> _save(Future<void> Function() action) async {
    emit(CategoryEditorSavingState());
    try {
      await action();
      await manageRepositoryCubit.reloadRepository();
      emit(CategoryEditorSavedState());
    } catch (e) {
      emit(CategoryEditorErrorState(e.toString()));
    }
  }
}
