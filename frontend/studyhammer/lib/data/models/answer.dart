class Answer {
  final String text;
  final bool? isCorrect;

  Answer({required this.text, this.isCorrect});

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    text:      json['text'],
    isCorrect: json['isCorrect'],
  );

  Map<String, dynamic> toJson() => {
    'text':      text,
    'isCorrect': isCorrect,
  };
}