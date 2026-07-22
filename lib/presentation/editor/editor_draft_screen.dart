import 'package:flutter/material.dart';

class EditorDraftScreen extends StatelessWidget {
  const EditorDraftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: ListView(
            children: const [
              _EditorDraftCard(headLine: "Kategorien"),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditorDraftCard extends StatelessWidget {
  final String headLine;

  const _EditorDraftCard({required this.headLine});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      borderOnForeground: true,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/editor/categories");
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              headLine,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
