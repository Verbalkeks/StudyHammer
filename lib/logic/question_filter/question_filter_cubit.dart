import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/data/models/context_object.dart';
import 'package:studyhammer/data/models/pocket.dart';
import 'package:studyhammer/data/models/question_type.dart';
import 'package:studyhammer/logic/question_filter/question_filter_criteria.dart';
import 'package:studyhammer/logic/question_filter/question_filter_engine.dart';
import 'package:studyhammer/logic/question_filter/question_filter_state.dart';

class QuestionFilterCubit extends Cubit<QuestionFilterState> {
  QuestionFilterCubit({
    required ContextObject repository,
    QuestionFilterEngine? engine,
  }) : this._(repository: repository, engine: engine ?? QuestionFilterEngine());

  QuestionFilterCubit._({required this.repository, required this.engine})
    : super(_initialState(repository, engine));

  final ContextObject repository;
  final QuestionFilterEngine engine;

  static QuestionFilterState _initialState(
    ContextObject repository,
    QuestionFilterEngine engine,
  ) {
    final criteria = QuestionFilterCriteria.empty();

    return QuestionFilterState(
      criteria: criteria,
      result: engine.apply(repository, criteria),
    );
  }

  void toggleCategory(String categoryId) {
    final categoryIds = _toggled(state.criteria.categoryIds, categoryId);
    final subcategoryIds = {...state.criteria.subcategoryIds};

    if (categoryIds.isNotEmpty) {
      final visibleSubcategoryIds = repository.subcategories
          .where((subcategory) => categoryIds.contains(subcategory.categoryId))
          .map((subcategory) => subcategory.id)
          .toSet();
      subcategoryIds.removeWhere(
        (subcategoryId) => !visibleSubcategoryIds.contains(subcategoryId),
      );
    }

    _emitCriteria(
      state.criteria.copyWith(
        categoryIds: categoryIds,
        subcategoryIds: subcategoryIds,
      ),
    );
  }

  void toggleSubcategory(String subcategoryId) {
    _emitCriteria(
      state.criteria.copyWith(
        subcategoryIds: _toggled(state.criteria.subcategoryIds, subcategoryId),
      ),
    );
  }

  void togglePocket(Pocket pocket) {
    _emitCriteria(
      state.criteria.copyWith(
        pockets: _toggled(state.criteria.pockets, pocket),
      ),
    );
  }

  void toggleQuestionType(QuestionType questionType) {
    _emitCriteria(
      state.criteria.copyWith(
        questionTypes: _toggled(state.criteria.questionTypes, questionType),
      ),
    );
  }

  void reset() {
    _emitCriteria(QuestionFilterCriteria.empty());
  }

  void _emitCriteria(QuestionFilterCriteria criteria) {
    emit(
      QuestionFilterState(
        criteria: criteria,
        result: engine.apply(repository, criteria),
      ),
    );
  }

  Set<T> _toggled<T>(Set<T> values, T value) {
    final nextValues = {...values};
    if (!nextValues.add(value)) {
      nextValues.remove(value);
    }

    return nextValues;
  }
}
