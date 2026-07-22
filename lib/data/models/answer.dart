import 'package:uuid/uuid.dart';

class Answer {
  String id;
  String questionId;
  String text;
  bool? isRightAnswer;
  Answer({
    String? id,
    required this.questionId,
    required this.text,
    this.isRightAnswer,
  }) : id = id ?? const Uuid().v7();

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'] as String,
      questionId: json['questionId'] as String,
      text: json['text'] as String,
      isRightAnswer: json['isRightAnswer'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'text': text,
      'isRightAnswer': isRightAnswer,
    };
  }

  @override
  String toString() {
    return 'Answer{id: $id, questionId: $questionId, text: $text, isRightAnswer: $isRightAnswer}';
  }
}
