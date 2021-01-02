import 'package:Gossips/models/Question.dart';

class QuizResult {
  Question question;
  int score;
  int wrong;
  int correct;
  int skip;
  String json;
  bool cloud;
  QuizResult({
    this.question,
    this.score,
    this.wrong,
    this.correct,
    this.skip,
    this.json,
    this.cloud,
  });
}
