import 'package:flutter/material.dart';
import 'package:studyhammer/data/models/answer.dart';
import 'package:studyhammer/data/models/question.dart';

class TextQuestionDetail extends StatelessWidget {
  const TextQuestionDetail({
    super.key,
    required this.question,
    required this.answers,
  });

  final Question question;
  final List<Answer> answers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: answers.map((answer) {
        final isCorrect = answer.isRightAnswer == true;

        return Card(
          color: isCorrect ? Colors.green : null,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(answer.text),
          ),
        );
      }).toList(),
    );
  }
}
