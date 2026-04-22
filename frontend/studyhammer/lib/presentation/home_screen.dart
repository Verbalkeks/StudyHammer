import 'package:flutter/material.dart';
import 'package:studyhammer/presentation/shared/coming_soon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Card(
          child: InkWell(
            onTap: null,
            child: Padding(padding: EdgeInsets.all(16), child: ComingSoon()),
          ),
        ),
      ],
    );
  }
}
