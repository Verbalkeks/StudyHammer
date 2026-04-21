import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, "/home");
    });
    return Scaffold(
      body: SafeArea(child: Center(
        child: Image.asset("assets/splash_screen.png")
      ),),
    );
  }
}