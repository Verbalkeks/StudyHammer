class Question {
  int? id;
  int cid;
  int? scid;
  int qtid;
  String questionText;

  Question({
    this.id,
    required this.cid,
    this.scid,
    required this.qtid,
    required this.questionText
  });
  
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int?,
      cid: json['cid'] as int,
      scid: json['scid'] as int?,
      qtid: json['qtid'] as int,
      questionText: json['question_text'] as String
    );
  }
}