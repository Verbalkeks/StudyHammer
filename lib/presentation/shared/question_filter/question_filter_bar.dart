import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/data/models/pocket.dart';
import 'package:studyhammer/data/models/question_type.dart';
import 'package:studyhammer/logic/question_filter/question_filter_cubit.dart';
import 'package:studyhammer/presentation/shared/question_filter/question_filter_section.dart';

class QuestionFilterBar extends StatelessWidget {
  const QuestionFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<QuestionFilterCubit>().state;
    final cubit = context.read<QuestionFilterCubit>();
    final criteria = state.criteria;
    final result = state.result;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              tooltip: 'Filter zurücksetzen',
              onPressed: state.hasActiveFilters ? cubit.reset : null,
              icon: const Icon(Icons.filter_alt_off),
            ),
          ),
          const SizedBox(height: 12),
          QuestionFilterSection(
            title: 'Kategorie',
            initiallyExpanded: criteria.categoryIds.isNotEmpty,
            children: result.availableCategories.map((category) {
              return FilterChip(
                label: Text(category.name),
                selected: criteria.categoryIds.contains(category.id),
                onSelected: (_) => cubit.toggleCategory(category.id),
              );
            }).toList(),
          ),
          QuestionFilterSection(
            title: 'Thema',
            initiallyExpanded: criteria.subcategoryIds.isNotEmpty,
            children: result.availableSubcategories.map((subcategory) {
              return FilterChip(
                label: Text(subcategory.name),
                selected: criteria.subcategoryIds.contains(subcategory.id),
                onSelected: (_) => cubit.toggleSubcategory(subcategory.id),
              );
            }).toList(),
          ),
          QuestionFilterSection(
            title: 'Pocket',
            initiallyExpanded: criteria.pockets.isNotEmpty,
            children: result.availablePockets.map((pocket) {
              return FilterChip(
                label: Text(_pocketLabel(pocket)),
                selected: criteria.pockets.contains(pocket),
                onSelected: (_) => cubit.togglePocket(pocket),
              );
            }).toList(),
          ),
          QuestionFilterSection(
            title: 'Fragetyp',
            initiallyExpanded: criteria.questionTypes.isNotEmpty,
            children: result.availableQuestionTypes.map((questionType) {
              return FilterChip(
                label: Text(_questionTypeLabel(questionType)),
                selected: criteria.questionTypes.contains(questionType),
                onSelected: (_) => cubit.toggleQuestionType(questionType),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _pocketLabel(Pocket pocket) {
    return switch (pocket) {
      Pocket.pocket1 => 'Pocket 1',
      Pocket.pocket2 => 'Pocket 2',
      Pocket.pocket3 => 'Pocket 3',
      Pocket.pocket4 => 'Pocket 4',
      Pocket.pocket5 => 'Pocket 5',
      Pocket.pocket6 => 'Pocket 6',
    };
  }

  String _questionTypeLabel(QuestionType questionType) {
    return switch (questionType) {
      QuestionType.singleChoice => 'Einfachauswahl',
      QuestionType.multipleChoice => 'Mehrfachauswahl',
      QuestionType.boolean => 'Wahr/Falsch',
      QuestionType.shortAnswer => 'Kurzantwort',
      QuestionType.essay => 'Freitext',
      QuestionType.vocabulary => 'Vokabel',
    };
  }
}
