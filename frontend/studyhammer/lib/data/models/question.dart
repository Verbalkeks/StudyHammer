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
}