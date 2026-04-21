import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/data/repositories/category_repository.dart';
import 'package:studyhammer/logic/category_state.dart';

class CategoryCubit extends Cubit<CategoryState>{
  final CategoryRepository repo;
  
  CategoryCubit({required this.repo}) : super(CategoryStateLoading());

  Future<void> onLoadAllCategorys() async {
    emit(CategoryStateLoading());
    try {
      final categories = await repo.loadAllCategorys();
      emit(CategoryStateLoaded(categories: categories));
    }
    catch (e) {
      emit(CategoryStateError(message: e.toString()));
    }
  }
}