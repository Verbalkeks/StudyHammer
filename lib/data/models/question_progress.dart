import 'package:uuid/uuid.dart';
import 'package:studyhammer/data/models/pocket.dart';

/* 
Diese Klasse repräsentiert den Fortschritt einer Frage,
dabei wird hinterlegt in welchem Pocket die Frage ist,
wann sie zuletzt richtig beantwortet wurde,
wann sie zuletzt beantwortet wurde,
wie oft sie richtig beantwortet wurde und
wie oft sie falsch beantwortet wurde.
*/
class QuestionProgress {
  String id;
  String questionId;
  Pocket pocket;
  DateTime? lastAnsweredCorrectAt;
  DateTime? lastAnsweredAt;
  int correctCount;
  int wrongCount;

  QuestionProgress({
    String? id,
    required this.questionId,
    required this.pocket,
    this.lastAnsweredCorrectAt,
    this.lastAnsweredAt,
    this.correctCount = 0,
    this.wrongCount = 0,
  }) : id = id ?? const Uuid().v7();

  factory QuestionProgress.fromJson(Map<String, dynamic> json) {
    return QuestionProgress(
      id: json['id'] as String,
      questionId: json['questionId'] as String,
      pocket: Pocket.values.byName(json['pocket'] as String),
      lastAnsweredCorrectAt: _parseDate(json['lastAnsweredCorrectAt']),
      lastAnsweredAt: _parseDate(json['lastAnsweredAt']),
      correctCount: json['correctCount'] as int,
      wrongCount: json['wrongCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'pocket': pocket.name,
      'lastAnsweredCorrectAt': lastAnsweredCorrectAt?.toIso8601String(),
      'lastAnsweredAt': lastAnsweredAt?.toIso8601String(),
      'correctCount': correctCount,
      'wrongCount': wrongCount,
    };
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) {
      return null;
    }

    return DateTime.parse(value as String);
  }
}
