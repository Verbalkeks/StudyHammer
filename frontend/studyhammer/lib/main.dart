import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/config/injection.dart';
import 'package:studyhammer/config/supabase_config.dart';
import 'package:studyhammer/logic/category_cubit.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/presentation/app_shell.dart';
import 'package:studyhammer/presentation/categories_screen.dart';
import 'package:studyhammer/presentation/category_detail_screen.dart';
import 'package:studyhammer/presentation/editor_screen.dart';
import 'package:studyhammer/presentation/home_screen.dart';
import 'package:studyhammer/presentation/quizmode_screen.dart';
import 'package:studyhammer/presentation/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  // Flutter Bindings initialisieren
  WidgetsFlutterBinding.ensureInitialized();

  // nur Vertikale Anzeigemodis erlauben
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Supabase-plugin initialisieren
  await Supabase.initialize(
    url: SupabaseConfig.url,
    anonKey: SupabaseConfig.anonKey,
  );

  // dependency injection
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(create: (_) => getIt<CategoryCubit>()),
      ],
      child: MaterialApp(
        theme: ThemeData(
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
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          "/home": (context) => AppShell(child: HomeScreen()),
          "/editor": (context) => AppShell(child: EditorScreen()),
          "/categories": (context) => AppShell(child: CategoriesScreen()),
          "/quizmode": (context) => AppShell(child: QuizmodeScreen()),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/category_detail') {
            final category = settings.arguments as Category;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => AppShell(child: CategoryDetailScreen(category: category)),
            );
          }
          return null;
        },
      ),
    );
  }
}
