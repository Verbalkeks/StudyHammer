import 'package:get_it/get_it.dart';
import 'package:studyhammer/data/repositories/data_repository.dart';
import 'package:studyhammer/data/repositories/local_repository.dart';
import 'package:studyhammer/logic/category_editor_cubit.dart';
import 'package:studyhammer/logic/manage_repository_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<DataRepository>(
     () => LocalRepository(),
  );
  getIt.registerLazySingleton(
     () => ManageRepositoryCubit(repository: getIt<DataRepository>())
 );
  getIt.registerFactory(
    () => CategoryEditorCubit(
      repository: getIt<DataRepository>(),
      manageRepositoryCubit: getIt<ManageRepositoryCubit>(),
    ),
  );
}
