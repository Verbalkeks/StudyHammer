import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_type.dart';
import 'package:studyhammer/logic/manage_repository_cubit.dart';
import 'package:studyhammer/logic/manage_repository_state.dart';
import 'package:studyhammer/presentation/study/boolean_question_detail.dart';
import 'package:studyhammer/presentation/study/choice_question_detail.dart';
import 'package:studyhammer/presentation/study/text_question_.dart';

class StudyDetailScreen extends StatefulWidget {
  const StudyDetailScreen({
    super.key,
    required this.questions,
    required this.initialIndex,
  });

  final List<Question> questions;
  final int initialIndex;

  @override
  State<StudyDetailScreen> createState() => _StudyDetailScreenState();
}

class _StudyDetailScreenState extends State<StudyDetailScreen> {
  late int currentIndex;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ManageRepositoryCubit>().state;

    if (state is! ManageRepositoryLoadedState) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Frage")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: widget.questions.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final question = widget.questions[index];
                    final answers = state.repository.answers
                        .where((answer) => answer.questionId == question.id)
                        .toList();
                    final detailWidget = switch (question.questionType) {
                      QuestionType.singleChoice ||
                      QuestionType.multipleChoice => ChoiceQuestionDetail(
                        question: question,
                        answers: answers,
                      ),
                      QuestionType.boolean => BooleanQuestionDetail(
                        question: question,
                        answers: answers,
                      ),
                      _ => TextQuestionDetail(
                        question: question,
                        answers: answers,
                      ),
                    };

                    return ListView(
                      children: [
                        Text(
                          question.text,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        detailWidget,
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: currentIndex == 0
                        ? null
                        : () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text("${currentIndex + 1} / ${widget.questions.length}"),
                  IconButton(
                    onPressed: currentIndex == widget.questions.length - 1
                        ? null
                        : () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
