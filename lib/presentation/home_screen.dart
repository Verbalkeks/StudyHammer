import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300,),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: ListView(
            children: [
              const _HomeScreenCard(routeName: "/editor", headLine: "Editor"),
              const _HomeScreenCard(routeName: "/quizmode", headLine: "Quizmodus"),
              const _HomeScreenCard(routeName: "/study", headLine: "Lesemodus"),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeScreenCard extends StatelessWidget {
  final String routeName;
  final String headLine;
  const _HomeScreenCard({
    required this.routeName,
    required this.headLine,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      borderOnForeground: true,
      child: InkWell(
        onTap: () {Navigator.popAndPushNamed(context, routeName);},
        child: Padding(padding: const EdgeInsets.all(16), child: Center(child: Text(headLine,style: const TextStyle(fontWeight: FontWeight.bold))),)),
      );
  }
}
