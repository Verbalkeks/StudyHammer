import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset("assets/coming_soon.png"), Text("Coming soon!")],
    );
  }
}
