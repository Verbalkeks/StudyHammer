import 'package:flutter/material.dart';
import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/models/question_type.dart';

class ChoiceQuestionDetail extends StatelessWidget {
  const ChoiceQuestionDetail({
    super.key,
    required this.question,
    required this.answers,
  });

  final Question question;
  final List<Answer> answers;

  @override
  Widget build(BuildContext context) {
    final isMultipleChoice = question.questionType == QuestionType.multipleChoice;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(isMultipleChoice ? 'Mehrfachauswahl' : 'Einfachauswahl'),
        const SizedBox(height: 12),
        ...answers.map((answer) => _AnswerCard(answer: answer)),
      ],
    );
  }
}

class _AnswerCard extends StatelessWidget {
  const _AnswerCard({required this.answer});

  final Answer answer;

  @override
  Widget build(BuildContext context) {
    final isCorrect = answer.isRightAnswer == true;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: isCorrect ? Colors.green : null,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isCorrect ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCorrect ? Colors.greenAccent : colorScheme.onSurface,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(answer.text)),
          ],
        ),
      ),
    );
  }
}
