import 'package:flutter/material.dart';

class QuestionFilterSection extends StatelessWidget {
  const QuestionFilterSection({
    super.key,
    required this.title,
    required this.initiallyExpanded,
    required this.children,
  });

  final String title;
  final bool initiallyExpanded;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(bottom: 12),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        initiallyExpanded: initiallyExpanded,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(spacing: 8, runSpacing: 8, children: children),
          ),
        ],
      ),
    );
  }
}
