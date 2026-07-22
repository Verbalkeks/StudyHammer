import 'package:studyhammer/logic/question_filter/question_filter_criteria.dart';
import 'package:studyhammer/logic/question_filter/question_filter_result.dart';

class QuestionFilterState {
  const QuestionFilterState({required this.criteria, required this.result});

  final QuestionFilterCriteria criteria;
  final QuestionFilterResult result;

  bool get hasActiveFilters => criteria.hasActiveFilters;
}
