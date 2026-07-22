import 'package:studyhammer/data/models/context_object.dart';
import 'package:studyhammer/data/models/pocket.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_progress.dart';
import 'package:studyhammer/data/models/question_type.dart';
import 'package:studyhammer/logic/question_filter/question_filter_criteria.dart';
import 'package:studyhammer/logic/question_filter/question_filter_result.dart';

/*
dies ist ein reines Rechenmodul, das keine UI-Elemente enthält.
Es filtert Fragen basierend auf den angegebenen Kriterien und gibt die gefilterten Ergebnisse zurück.
apply ist der einstiegspunkt und wird im question_filter-cubit aufgerufen.
Es nimmt ein ContextObject (das die Fragen, Kategorien, Unterkategorien und Fortschritte enthält) und die Filterkriterien entgegen
und gibt ein QuestionFilterResult zurück, das die gefilterten Fragen und die verfügbaren Filteroptionen enthält.
*/
class QuestionFilterEngine {
  QuestionFilterResult apply(
    ContextObject repository,
    QuestionFilterCriteria criteria,
  ) {
    final progressByQuestionId = {
      for (final progress in repository.questionProgresses)
        progress.questionId: progress,
    };

    final filteredQuestions = repository.questions
        .where(
          (question) => _matches(
            question,
            criteria: criteria,
            progressByQuestionId: progressByQuestionId,
          ),
        )
        .toList();

    return QuestionFilterResult(
      filteredQuestions: filteredQuestions,
      availableCategories: repository.categories.where((category) {
        return criteria.categoryIds.contains(category.id) ||
            _hasAnyMatch(
              repository.questions,
              progressByQuestionId,
              criteria.copyWith(
                categoryIds: _toggled(criteria.categoryIds, category.id),
              ),
            );
      }).toList(),
      availableSubcategories: repository.subcategories.where((subcategory) {
        if (criteria.categoryIds.isNotEmpty &&
            !criteria.categoryIds.contains(subcategory.categoryId)) {
          return false;
        }

        return criteria.subcategoryIds.contains(subcategory.id) ||
            _hasAnyMatch(
              repository.questions,
              progressByQuestionId,
              criteria.copyWith(
                subcategoryIds: _toggled(
                  criteria.subcategoryIds,
                  subcategory.id,
                ),
              ),
            );
      }).toList(),
      availablePockets: Pocket.values.where((pocket) {
        return criteria.pockets.contains(pocket) ||
            _hasAnyMatch(
              repository.questions,
              progressByQuestionId,
              criteria.copyWith(pockets: _toggled(criteria.pockets, pocket)),
            );
      }).toList(),
      availableQuestionTypes: QuestionType.values.where((questionType) {
        return criteria.questionTypes.contains(questionType) ||
            _hasAnyMatch(
              repository.questions,
              progressByQuestionId,
              criteria.copyWith(
                questionTypes: _toggled(criteria.questionTypes, questionType),
              ),
            );
      }).toList(),
    );
  }

  bool _hasAnyMatch(
    List<Question> questions,
    Map<String, QuestionProgress> progressByQuestionId,
    QuestionFilterCriteria criteria,
  ) {
    return questions.any(
      (question) => _matches(
        question,
        criteria: criteria,
        progressByQuestionId: progressByQuestionId,
      ),
    );
  }

  bool _matches(
    Question question, {
    required QuestionFilterCriteria criteria,
    required Map<String, QuestionProgress> progressByQuestionId,
  }) {
    if (criteria.categoryIds.isNotEmpty &&
        !criteria.categoryIds.contains(question.categoryId)) {
      return false;
    }

    if (criteria.subcategoryIds.isNotEmpty &&
        !criteria.subcategoryIds.contains(question.subcategoryId)) {
      return false;
    }

    if (criteria.pockets.isNotEmpty) {
      final progress = progressByQuestionId[question.id];
      if (progress == null || !criteria.pockets.contains(progress.pocket)) {
        return false;
      }
    }

    if (criteria.questionTypes.isNotEmpty &&
        !criteria.questionTypes.contains(question.questionType)) {
      return false;
    }

    return true;
  }

  Set<T> _toggled<T>(Set<T> values, T value) {
    final nextValues = {...values};
    if (!nextValues.add(value)) {
      nextValues.remove(value);
    }

    return nextValues;
  }
}
