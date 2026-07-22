import 'package:studyhammer/data/models/pocket.dart';
import 'package:studyhammer/data/models/question_type.dart';

class QuestionFilterCriteria {
  final Set<String> categoryIds;
  final Set<String> subcategoryIds;
  final Set<Pocket> pockets;
  final Set<QuestionType> questionTypes;
  
  const QuestionFilterCriteria({
    required this.categoryIds,
    required this.subcategoryIds,
    required this.pockets,
    required this.questionTypes,
  });

  factory QuestionFilterCriteria.empty() {
    return const QuestionFilterCriteria(
      categoryIds: {},
      subcategoryIds: {},
      pockets: {},
      questionTypes: {},
    );
  }


  bool get hasActiveFilters =>
      categoryIds.isNotEmpty ||
      subcategoryIds.isNotEmpty ||
      pockets.isNotEmpty ||
      questionTypes.isNotEmpty;

  QuestionFilterCriteria copyWith({
    Set<String>? categoryIds,
    Set<String>? subcategoryIds,
    Set<Pocket>? pockets,
    Set<QuestionType>? questionTypes,
  }) {
    return QuestionFilterCriteria(
      categoryIds: categoryIds ?? this.categoryIds,
      subcategoryIds: subcategoryIds ?? this.subcategoryIds,
      pockets: pockets ?? this.pockets,
      questionTypes: questionTypes ?? this.questionTypes,
    );
  }
}
