import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(
      context,
    )?.settings.name; // Variable mit der aktuellen Route
    bool isCurrentRoute(String route) {
      return currentRoute == route;
    } // Hilfmethode um Buttons zu deaktiveren, dessen Route gerade aktiv ist

    return Scaffold(
      appBar: AppBar(
        leading: isCurrentRoute("/home")
            ? Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Image.asset("assets/logo.png"),
              )
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Zurück',
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
              ),
        title: const Text("StudyHammer"),
        actions: [
          // Hamburger-Button rechts öffnet den endDrawer
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Navigation öffnen',
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            TextButton(
              onPressed: isCurrentRoute("/home")
                  ? null
                  : () {
                      Navigator.popAndPushNamed(context, "/home");
                    },
              child: Text("Home"),
            ),
            TextButton(
              onPressed: isCurrentRoute("/editor")
                  ? null
                  : () {
                      Navigator.popAndPushNamed(context, "/editor");
                    },
              child: Text("Editor"),
            ),
            TextButton(
              onPressed: isCurrentRoute("/categories")
                  ? null
                  : () {
                      Navigator.popAndPushNamed(context, "/categories");
                    },
              child: Text("Kategorien"),
            ),
            TextButton(
              onPressed: isCurrentRoute("/quizmode")
                  ? null
                  : () {
                      Navigator.popAndPushNamed(context, "/quizmode");
                    },
              child: Text("Quizmodus"),
            ),
          ],
        ),
      ),
      body: SafeArea(child: child),
    );
  }
}
