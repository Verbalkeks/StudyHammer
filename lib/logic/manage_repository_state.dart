import 'package:studyhammer/data/models/context_object.dart';

class ManageRepositoryState {}
class ManageRepositoryLoadingState extends ManageRepositoryState {}
class ManageRepositoryLoadedState extends ManageRepositoryState {
  final ContextObject repository;
  ManageRepositoryLoadedState(this.repository);
}
class ManageRepositoryErrorState extends ManageRepositoryState {
  final String message;
  ManageRepositoryErrorState(this.message);
}