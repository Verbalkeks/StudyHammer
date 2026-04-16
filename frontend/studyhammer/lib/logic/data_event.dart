import 'package:studyhammer/data/models/question.dart';

abstract class DataEvent {}
class LoadData extends DataEvent {}
class AddQuestion extends DataEvent {
  final String categoryName;
  final Question question;
  AddQuestion(this.categoryName, this.question);
}

class DeleteQuestion extends DataEvent {
  final String categoryName;
  final int index;
  DeleteQuestion(this.categoryName, this.index);
}
