// ignore_for_file: file_names

import 'package:simple_quiz_app/questionModel.dart';

class QuestionBrain {
  int _questionIndex = 0;

  final List<Question> _questionBank = [
    Question(
      questionText:
          "There are two parts of the body that can't heal themselves",
      questionAnswer: false,
    ),
    Question(
      questionText: "Howard Donald is the oldest member of Take That",
      questionAnswer: true,
    ),
    Question(
      questionText:
          "The Great Wall of China is longer than the distance between London and Beijing",
      questionAnswer: true,
    ),
    Question(
      questionText: "There are 219 episodes of Friends",
      questionAnswer: false,
    ),
    Question(
      questionText:
          "'A' is the most common letter used in the English language",
      questionAnswer: false,
    ),
  ];

  String getQuestion() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  void nextQuestion() {
    if (_questionIndex < _questionBank.length) {
      _questionIndex++;
    }
  }
}
