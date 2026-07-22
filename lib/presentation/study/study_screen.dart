import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/logic/manage_repository_cubit.dart';
import 'package:studyhammer/logic/manage_repository_state.dart';
import 'package:studyhammer/logic/question_filter/question_filter_cubit.dart';
import 'package:studyhammer/logic/question_filter/question_filter_state.dart';
import 'package:studyhammer/presentation/shared/question_filter/question_filter_bar.dart';
import 'package:studyhammer/presentation/study/study_detail_screen.dart';
import 'package:studyhammer/presentation/study/study_question_card.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ManageRepositoryCubit>().state;

    if (state is! ManageRepositoryLoadedState) {
      return const SizedBox.shrink();
    }

    if (state.repository.questions.isEmpty) {
      return const Center(child: Text('Keine Fragen im Repository'));
    }

    return BlocProvider(
      create: (_) => QuestionFilterCubit(repository: state.repository),
      child: const _StudyContent(),
    );
  }
}

class _StudyContent extends StatelessWidget {
  const _StudyContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionFilterCubit, QuestionFilterState>(
      builder: (context, state) {
        final questions = state.result.filteredQuestions;

        return ListView.builder(
          itemCount: questions.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const QuestionFilterBar();
            }

            final questionIndex = index - 1;
            final question = questions[questionIndex];

            return StudyQuestionCard(
              question: question,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudyDetailScreen(
                      questions: questions,
                      initialIndex: questionIndex,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
