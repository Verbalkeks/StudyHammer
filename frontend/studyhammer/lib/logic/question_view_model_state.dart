import 'package:studyhammer/data/models/question_view_model.dart';

abstract class QuestionViewModelState {}
class QuestionViewModelStateLoading extends QuestionViewModelState{}
class QuestionViewModelStateLoaded extends QuestionViewModelState{
  final List<QuestionViewModel> questionViewModels;
  QuestionViewModelStateLoaded({required this.questionViewModels});
}
class QuestionViewModelStateError extends QuestionViewModelState{
  final String message;
  QuestionViewModelStateError({required this.message});
}