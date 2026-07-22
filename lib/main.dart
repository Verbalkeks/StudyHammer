import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/config/injection.dart';
import 'package:studyhammer/logic/category_editor_cubit.dart';
import 'package:studyhammer/logic/manage_repository_cubit.dart';
import 'package:studyhammer/presentation/app_shell.dart';
import 'package:studyhammer/presentation/editor/category_editor_screen.dart';
import 'package:studyhammer/presentation/editor/editor_draft_screen.dart';
import 'package:studyhammer/presentation/home_screen.dart';
import 'package:studyhammer/presentation/quizmode/quizmode_screen.dart';
import 'package:studyhammer/presentation/splash_screen.dart';
import 'package:studyhammer/presentation/study/study_screen.dart';


Future<void> main() async {
  // Flutter Bindings initialisieren
  WidgetsFlutterBinding.ensureInitialized();

  // nur Vertikale Anzeigemodis erlauben
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // dependency injection
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ManageRepositoryCubit>(),
      child: MaterialApp(
        theme: studyHammerTheme(),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          "/home": (context) => AppShell(child: HomeScreen()),
          "/editor": (context) => AppShell(child: EditorDraftScreen()),
          "/editor/categories": (context) => BlocProvider(
            create: (context) => getIt<CategoryEditorCubit>(),
            child: AppShell(child: CategoryEditorScreen()),
          ),
          "/quizmode": (context) => AppShell(child: QuizmodeScreen()),
          "/study": (context) => AppShell(child: StudyScreen()),
        },
      ),
    );
  }

  ThemeData studyHammerTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF290F3F),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF290F3F),
        brightness: Brightness.dark,
        surface: const Color(0xFF290F3F),
        onSurface: const Color(0xFFFFD700),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFFFD700)),
        bodyMedium: TextStyle(color: Color(0xFFFFD700)),
        bodySmall: TextStyle(color: Color(0xFFFFD700)),
        displayLarge: TextStyle(color: Color(0xFFFFD700)),
        displayMedium: TextStyle(color: Color(0xFFFFD700)),
        displaySmall: TextStyle(color: Color(0xFFFFD700)),
        headlineLarge: TextStyle(color: Color(0xFFFFD700)),
        headlineMedium: TextStyle(color: Color(0xFFFFD700)),
        headlineSmall: TextStyle(color: Color(0xFFFFD700)),
        titleLarge: TextStyle(color: Color(0xFFFFD700)),
        titleMedium: TextStyle(color: Color(0xFFFFD700)),
        titleSmall: TextStyle(color: Color(0xFFFFD700)),
        labelLarge: TextStyle(color: Color(0xFFFFD700)),
        labelMedium: TextStyle(color: Color(0xFFFFD700)),
        labelSmall: TextStyle(color: Color(0xFFFFD700)),
      ),
    );
  }
}
