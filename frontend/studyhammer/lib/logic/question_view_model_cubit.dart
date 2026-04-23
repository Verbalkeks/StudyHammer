import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/data/repositories/data_repository.dart';
import 'package:studyhammer/logic/question_view_model_state.dart';

class QuestionViewModelCubit extends Cubit<QuestionViewModelState> {
  final DataRepository repo;

  QuestionViewModelCubit({required this.repo})
    : super(QuestionViewModelStateLoading());

  Future<void> onLoadAllQuestionViewModels(int id) async {
    emit(QuestionViewModelStateLoading());
    try {
      final questionViewModels = await repo.getQuestionViewModels(id);
      emit(
        QuestionViewModelStateLoaded(questionViewModels: questionViewModels),
      );
    } catch (e) {
      emit(QuestionViewModelStateError(message: e.toString()));
    }
  }
}
