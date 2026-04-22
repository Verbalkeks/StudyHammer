class Answer {
  int? id;
  int qid;
  String answerText;
  bool? isRightAnswer;
  Answer({
    this.id,
    required this.qid,
    required this.answerText,
    this.isRightAnswer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'] as int?,
      qid: json['qid'] as int,
      answerText: json['answer_text'] as String,
    );
  }
}
