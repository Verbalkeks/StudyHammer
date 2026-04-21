class Answer {
  int? id;
  int qid;
  String answerText;
  bool? isRightAnswer;
  Answer({
    this.id,
    required this.qid,
    required this. answerText,
    this.isRightAnswer
  });
}