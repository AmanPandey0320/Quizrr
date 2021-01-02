// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
    Question({
        this.responseCode,
        this.results,
    });

    int responseCode;
    List<Result> results;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        responseCode: json["response_code"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.category,
        this.type,
        this.difficulty,
        this.question,
        this.correctAnswer,
        this.incorrectAnswers,
    });

    String category;
    Type type;
    Difficulty difficulty;
    String question;
    String correctAnswer;
    List<String> incorrectAnswers;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: json["category"],
        type: typeValues.map[json["type"]],
        difficulty: difficultyValues.map[json["difficulty"]],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "type": typeValues.reverse[type],
        "difficulty": difficultyValues.reverse[difficulty],
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
    };
}

enum Difficulty { HARD, MEDIUM }

final difficultyValues = EnumValues({
    "hard": Difficulty.HARD,
    "medium": Difficulty.MEDIUM
});

enum Type { MULTIPLE }

final typeValues = EnumValues({
    "multiple": Type.MULTIPLE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
