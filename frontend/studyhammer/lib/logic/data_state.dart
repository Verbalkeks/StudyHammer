import 'package:studyhammer/data/models/question.dart';

abstract class DataState {}
class DataLoading extends DataState {
  
}
class DataLoaded extends DataState {
  final List<Question> questions;
  DataLoaded(this.questions);
}
class DataError extends DataState {
  final String message;
  DataError(this.message);
}
