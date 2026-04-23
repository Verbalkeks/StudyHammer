import 'package:get_it/get_it.dart';
import 'package:studyhammer/data/repositories/data_repository.dart';
import 'package:studyhammer/data/repositories/supabase_data_repository.dart';
import 'package:studyhammer/logic/category_cubit.dart';
import 'package:studyhammer/logic/question_view_model_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  final client = Supabase.instance.client;
  
  getIt.registerLazySingleton<DataRepository>(
    () => SupabaseDataRepository(client),
  );
  getIt.registerLazySingleton(
    () => CategoryCubit(repo: getIt<DataRepository>())
  );
  getIt.registerLazySingleton(
    () => QuestionViewModelCubit(repo: getIt<DataRepository>())
  );
}
