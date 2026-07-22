import 'package:flutter/material.dart';
import 'package:studyhammer/data/models/question.dart';

class StudyQuestionCard extends StatelessWidget {
  const StudyQuestionCard({
    super.key,
    required this.question,
    required this.onTap,
  });

  final Question question;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            question.text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
