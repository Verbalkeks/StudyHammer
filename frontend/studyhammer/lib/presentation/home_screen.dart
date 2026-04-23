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
              _HomeScreenCard(routeName: "/editor", headLine: "Editor"),
              _HomeScreenCard(routeName: "/categories", headLine: "Kategorien"),
              _HomeScreenCard(routeName: "/quizmode", headLine: "Quizmodus"),
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
    super.key,
    required this.routeName,
    required this.headLine,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      borderOnForeground: true,
      child: InkWell(
        onTap: () {Navigator.popAndPushNamed(context, routeName);},
        child: Padding(padding: EdgeInsets.all(16), child: Center(child: Text(headLine,style: TextStyle(fontWeight: FontWeight.bold))),)),
      );
  }
}
