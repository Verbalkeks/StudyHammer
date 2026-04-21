import 'package:studyhammer/data/models/category.dart';

abstract class CategoryState {}
class CategoryStateLoading extends CategoryState {}
class CategoryStateLoaded extends CategoryState {
  final List<Category> categories;
  CategoryStateLoaded({required this.categories});
}
class CategoryStateError extends CategoryState {
  final String message;
  CategoryStateError({required this.message});
}
