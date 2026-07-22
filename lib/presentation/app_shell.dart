import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/logic/manage_repository_cubit.dart';
import 'package:studyhammer/logic/manage_repository_state.dart';

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
              onPressed: isCurrentRoute("/quizmode")
                  ? null
                  : () {
                      Navigator.popAndPushNamed(context, "/quizmode");
                    },
              child: Text("Quizmodus"),
            ),
            TextButton(
              onPressed: isCurrentRoute("/study")
                  ? null
                  : () {
                      Navigator.popAndPushNamed(context, "/study");
                    },
              child: Text("Lesemodus"),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<ManageRepositoryCubit, ManageRepositoryState>(
            listener: (context, state) {
              if (state is ManageRepositoryErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } // Hier könnte
            },
            builder: (context, state) {
              switch (state) {
                case ManageRepositoryLoadingState():
                  return const Center(child: CircularProgressIndicator());
                case ManageRepositoryLoadedState():
                  return child;
                case ManageRepositoryErrorState():
                  return const Center(child: Text("Fehler beim Laden der Daten"));
                default:
                  return child;
              }
            },
          ),
        ),
      ),
    );
  }
}
