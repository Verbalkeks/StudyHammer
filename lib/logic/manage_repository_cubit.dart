import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/data/repositories/data_repository.dart';
import 'package:studyhammer/logic/manage_repository_state.dart';

class ManageRepositoryCubit extends Cubit<ManageRepositoryState> {
  final DataRepository repository;
  ManageRepositoryCubit({required this.repository})
    : super(ManageRepositoryLoadingState()) {
    reloadRepository();
  }

  Future<void> reloadRepository() async {
    try {
      final repo = await repository.readAllContext();
      emit(ManageRepositoryLoadedState(repo));
    } catch (e) {
      emit(ManageRepositoryErrorState(e.toString()));
    }
  }
}
