class QuestionType {
  int? id;
  String questionTypeName;
  String questionTypeDescription;
  QuestionType({
    this.id,
    required this.questionTypeName,
    required this.questionTypeDescription
  });

  factory QuestionType.fromJson(Map<String, dynamic> json){
    return QuestionType(
      id: json['id'] as int?,
      questionTypeName: json['question_type_name'] as String,
      questionTypeDescription: json['question_type_description'] as String
    );
  }
}